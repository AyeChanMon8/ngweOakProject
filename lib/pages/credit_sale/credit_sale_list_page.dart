import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ngwe_oak_project/pages/cash_sale/cash_sale_create_page.dart';
import 'package:ngwe_oak_project/utils/constants.dart';

import 'credit_sale_create_page.dart';
class CreditSaleListPage extends StatefulWidget {
  const CreditSaleListPage({ Key? key }) : super(key: key);

  @override
  State<CreditSaleListPage> createState() => _CreditSaleListPageState();
}

class _CreditSaleListPageState extends State<CreditSaleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Credit Sale',
          style: TextStyle(),
        )
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Get.to(CreditSaleCreatePage());
          }),
    );
  }
}