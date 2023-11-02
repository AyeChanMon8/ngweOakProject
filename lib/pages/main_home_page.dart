// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngwe_oak_project/pages/cash_sale/cash_sale_list_page.dart';
import 'package:ngwe_oak_project/utils/constants.dart';
import 'package:ngwe_oak_project/utils/my_style.dart';
class MainHomePage extends StatefulWidget {

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final numbers = List.generate(6, (index) => '$index');
  final controller = ScrollController();
  List admin = [
    [Icons.monetization_on, 'Cash Sale',CashSaleListPage()],
    [Icons.receipt, 'Credit Sale'],
    [Icons.description, 'Stock Request'],
    [Icons.account_balance_wallet, 'Expense Request'],
    [Icons.money, 'Cash Amount To Paid'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 10),
          color: Colors.white30,
          child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 childAspectRatio: 0.9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 0,
                crossAxisCount: 3,
              ),
              itemCount: admin.length,
              itemBuilder: (context, index) {
                return Card(
                 // color: Colors.grey[50],
                  elevation: 2,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: kSPrimaryColor,
                        child: IconButton(
                          iconSize: 17,
                          padding: EdgeInsets.zero,
                          icon: Icon(admin[index][0]),
                          color: Colors.white,
                          onPressed: () {
                            Get.to(admin[index][2]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            (admin[index][1]),
                            style: menuTextStyle(),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })),
    );
  }

  Widget buildGridView() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        controller: controller,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final item = numbers[index];

          return buildNumber(item);
        },
      );

  Widget buildNumber(String number) => Container(
        padding: EdgeInsets.all(16),
        color: Colors.orange,
        child: GridTile(
          child: Center(child: Image.asset('assets/images/Pos.jpeg')),
          footer: Text(
            'Footer $number',
            textAlign: TextAlign.center,
          ),
        ),
      );
}
