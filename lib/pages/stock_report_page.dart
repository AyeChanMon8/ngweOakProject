import 'package:flutter/material.dart';
class StockReportPage extends StatefulWidget {
  const StockReportPage({ Key? key }) : super(key: key);

  @override
  State<StockReportPage> createState() => _StockReportPageState();
}

class _StockReportPageState extends State<StockReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('StrockReport'),
    );
  }
}