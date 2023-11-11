// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngwe_oak_project/models/customer.dart';
import 'package:ngwe_oak_project/services/cash_sale_service.dart';

class CashSaleController extends GetxController {
  static CashSaleController to = Get.find();
  CashSaleService cashSaleService;
  TextEditingController priceListController;
  TextEditingController paymentTermsController;
  var customerList = List<Customer>().obs;
  Rx<Customer> _selectedCustomer = Customer().obs;
  Customer get selectedCustomer => _selectedCustomer.value;
  set selectedCustomer(Customer type) =>
      _selectedCustomer.value = type;
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
      }
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
    update();
  }
}
