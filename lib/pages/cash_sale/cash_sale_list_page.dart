import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ngwe_oak_project/utils/constants.dart';
class CashSaleListPage extends StatefulWidget {
  const CashSaleListPage({ Key? key }) : super(key: key);

  @override
  State<CashSaleListPage> createState() => _CashSaleListPageState();
}

class _CashSaleListPageState extends State<CashSaleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Cash Sale',
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
            
          }),
    );
  }
}