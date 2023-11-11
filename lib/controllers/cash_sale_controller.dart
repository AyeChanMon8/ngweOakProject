// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngwe_oak_project/models/customer.dart';
import 'package:ngwe_oak_project/models/product.dart';
import 'package:ngwe_oak_project/services/cash_sale_service.dart';

class CashSaleController extends GetxController {
  static CashSaleController to = Get.find();
  CashSaleService cashSaleService;
  TextEditingController priceListController;
  TextEditingController paymentTermsController;
  var customerList = List<Customer>().obs;
  var productList = List<Product>().obs;
  Rx<Customer> _selectedCustomer = Customer().obs;
  Customer get selectedCustomer => _selectedCustomer.value;
  set selectedCustomer(Customer type) =>
      _selectedCustomer.value = type;
  Rx<Product> _selectedProduct = Product().obs;
  Product get selectedProduct => _selectedProduct.value;
  set selectedProduct(Product type) =>
      _selectedProduct.value = type;
  RxString selectedPricelist = "".obs;

  @override
  void onReady() async {
    super.onReady();
    this.cashSaleService = await CashSaleService().init();
    getCustomersList();
  }

  @override
  void onInit() {
    super.onInit();
    priceListController = TextEditingController();
    paymentTermsController = TextEditingController();
  }

  void getCustomersList() async {
    customerList.value = [];
    await cashSaleService.getCustomer().then((data) {
      for (int i = 0; i < data.length; i++) {
        customerList.add(
          Customer(
              id: data[i].id,
              name: data[i].name,
              pricelist: data[i].pricelist,
              payment_terms: data[i].payment_terms),
        );
      }
      if(customerList.value.length > 0){
        this.selectedCustomer = customerList.value[0];
        priceListController.text = customerList.value[0].pricelist;
        paymentTermsController.text = customerList.value[0].payment_terms;
        this.getProductList(this.selectedCustomer.id);
      }
      
    });
  }

  void getProductList(int cus_id) async {
    await cashSaleService.getProductList(cus_id).then((data) {
       for (int i = 0; i < data.length; i++) {
        productList.add(
          Product(
              id: data[i].id,
              customer_id: data[i].customer_id,
              name: data[i].name),
        );
      }
      if(productList.value.length > 0){
        this.selectedProduct = productList.value[0];
      }
      print("product List >>"+productList.length.toString());
    });
  }

  void onChangeCustomerDropdown(
      Customer customerCategory) async {
    this.selectedCustomer = customerCategory;
    priceListController.text = customerCategory.pricelist;
    paymentTermsController.text = customerCategory.payment_terms;
    int id = selectedCustomer.id;
    // this.travel_expense_product_list.value.clear();
    // getTravelExpenseProduct(id);
    this.productList.value = [];
    this.getProductList(this.selectedCustomer.id);
    update();
  }

  void onChangeProductDropdown(
      Product productCategory) async {
    this.selectedProduct = productCategory;
    update();
  }
}
