// @dart=2.9

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:ngwe_oak_project/models/customer.dart';
import 'package:ngwe_oak_project/models/product.dart';

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

  Future<List<Product>> getProductList(int cus_id) async {
    var data = await rootBundle.loadString("assets/json/product.json");
    List<Product> productList = new List<Product>();
    List<dynamic> list = json.decode(data);
      list.forEach((v) {
        if(v['customer_id'] == cus_id){
          productList.add(Product.fromMap(v));
        }
        
      });
    return productList;
  }
}