// @dart=2.9

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:ngwe_oak_project/models/customer.dart';

class CreditSaleService extends GetxService {
  Dio dioClient;
  @override
  Future<CreditSaleService> init() async {
    print('EmployeeService has been initialize');
    return this;
  }

  Future<List<Customer>> getCustomer() async {
    var data = await rootBundle.loadString("assets/json/customer.json");
    List<Customer> customerList = new List<Customer>();
    List<dynamic> list = json.decode(data);
      list.forEach((v) {
        customerList.add(Customer.fromMap(v));
      });
    return customerList;
  }
}