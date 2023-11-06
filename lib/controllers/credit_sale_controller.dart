// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:ngwe_oak_project/models/customer.dart';
import 'package:ngwe_oak_project/services/credit_sale_service.dart';

class CreditSaleController extends GetxController {
  static CreditSaleController to = Get.find();
  CreditSaleService creditSaleService;
  var customerList = List<Customer>().obs;

  @override
  void onReady() async {
    super.onReady();
    this.creditSaleService = await CreditSaleService().init();
    getCustomersList();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void getCustomersList() async {
    await creditSaleService.getCustomer().then((data) {
      for (int i = 0; i < data.length; i++) {
        customerList.add(
          Customer(
              id: data[i].id,
              name: data[i].name,
              pricelist: data[i].pricelist,
              payment_terms: data[i].payment_terms),
        );
      }
    });
  }
}
