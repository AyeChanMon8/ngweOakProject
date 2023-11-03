// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ngwe_oak_project/utils/constants.dart';

class CashSaleCreatePage extends StatefulWidget {
  @override
  State<CashSaleCreatePage> createState() => _CashSaleCreatePageState();
}

class _CashSaleCreatePageState extends State<CashSaleCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyParent = GlobalKey<FormState>();
  String dropdownValue = 'Aye Aye';
  String productDropdownValue = 'Coca-Cola';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Cash Sale',
            style: TextStyle(),
          )),
      body: Form(
        key: _formKeyParent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 59,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: kPrimaryColor,
                  ),
                  child: InputDecorator(
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        // Step 3.
                        value: dropdownValue,
                        // Step 4.
                        items: <String>['Aye Aye', 'Mg Mg', 'Saw Saw', 'Waddy']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: kPrimaryColor,
                  ),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: ('Pricelist'),
                    ),
                    onChanged: null,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: kPrimaryColor,
                  ),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: ('Payment Terms'),
                    ),
                    onChanged: null,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: kPrimaryColor,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: ('Payment Journal'),
                    ),
                    onChanged: null,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GFButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Positioned(
                                  right: -40.0,
                                  top: -40.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.close),
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          height: 70,
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: InputDecorator(
                                            decoration: const InputDecoration(border: OutlineInputBorder()),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                isExpanded: true,
                                                // Step 3.
                                                value: productDropdownValue,
                                                // Step 4.
                                                items: <String>[
                                                  'Coca-Cola',
                                                  'Sunkist',
                                                  'Max',
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style:
                                                          TextStyle(fontSize: 16),
                                                    ),
                                                  );
                                                }).toList(),
                                                // Step 5.
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    productDropdownValue = newValue;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ('Quantity'),
                                            ),
                                            onChanged: (text) {},
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ('Unit Price'),
                                            ),
                                            onChanged: (text) {},
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: TextField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ('Tax 15.00%'),
                                            ),
                                            onChanged: null,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: TextField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ('100,000'),
                                            ),
                                            onChanged: null,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 14.0),
                                          child: GFButton(
                                            onPressed: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();
                                              }
                                              // saveTraveline();
                                            },
                                            text: "Add",
                                            color: kButtonColor,
                                            blockButton: true,
                                            size: GFSize.LARGE,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  text: 'Add Order Lines',
                  color: kButtonColor,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  shape: GFButtonShape.pills,
                  blockButton: true,
                ),
              ),

              // Obx(
              //   () => controller.travelLineList.length > 0
              //       ? travelTitleWidget(context)
              //       : new Container(),
              // ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              // travelWidget(context),
              // SizedBox(
              //   height: 20,
              // ),

              // Obx(
              //   () => controller.is_show_expense.value
              //       ? GFButton(
              //           onPressed: () {
              //             controller.quantityTextController.text = "1";
              //             controller.unitPriceController.text = "";
              //             controller.amountController.text = "";
              //             controller.remarkTextController.text = "";
              //             showDialog(
              //                 context: context,
              //                 builder: (BuildContext context) {
              //                   return AlertDialog(
              //                     content: Stack(
              //                       overflow: Overflow.visible,
              //                       children: <Widget>[
              //                         Positioned(
              //                           right: -40.0,
              //                           top: -40.0,
              //                           child: InkResponse(
              //                             onTap: () {
              //                               Navigator.of(context).pop();
              //                             },
              //                             child: CircleAvatar(
              //                               child: Icon(Icons.close),
              //                               backgroundColor: Colors.red,
              //                             ),
              //                           ),
              //                         ),
              //                         Form(
              //                           key: _formKey,
              //                           child: SingleChildScrollView(
              //                             child: Column(
              //                               children: [
              //                                 expenseCategoryDropDown(),
              //                                 Row(
              //                                   children: [
              //                                     Expanded(
              //                                       child: Container(
              //                                           margin: EdgeInsets.only(
              //                                               top: 10),
              //                                           child: Theme(
              //                                             data: new ThemeData(
              //                                               primaryColor:
              //                                                   textFieldTapColor,
              //                                             ),
              //                                             child: TextField(
              //                                               controller: controller
              //                                                   .quantityTextController,
              //                                               decoration:
              //                                                   InputDecoration(
              //                                                 border:
              //                                                     OutlineInputBorder(),
              //                                                 hintText: labels
              //                                                     ?.quantity,
              //                                               ),
              //                                               onChanged: (text) {
              //                                                 controller
              //                                                     .calculateAmount();
              //                                               },
              //                                             ),
              //                                           )),
              //                                     ),
              //                                     Expanded(
              //                                       child: Container(
              //                                           margin: EdgeInsets.only(
              //                                               left: 10, top: 10),
              //                                           child: Theme(
              //                                             data: new ThemeData(
              //                                               primaryColor:
              //                                                   textFieldTapColor,
              //                                             ),
              //                                             child: TextField(
              //                                               controller: controller
              //                                                   .unitPriceController,
              //                                               decoration:
              //                                                   InputDecoration(
              //                                                 border:
              //                                                     OutlineInputBorder(),
              //                                                 hintText: labels
              //                                                     ?.unitPrice,
              //                                               ),
              //                                               onChanged: (text) {
              //                                                 controller
              //                                                     .calculateAmount();
              //                                               },
              //                                             ),
              //                                           )),
              //                                     ),
              //                                   ],
              //                                 ),
              //                                 Container(
              //                                   margin: EdgeInsets.only(
              //                                       top: 10, bottom: 10),
              //                                   child: Theme(
              //                                     data: new ThemeData(
              //                                       primaryColor:
              //                                           textFieldTapColor,
              //                                     ),
              //                                     child: TextField(
              //                                       enabled: false,
              //                                       controller: controller
              //                                           .amountController,
              //                                       decoration: InputDecoration(
              //                                         border:
              //                                             OutlineInputBorder(),
              //                                         hintText: labels?.amount,
              //                                       ),
              //                                       onChanged: (text) {},
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 Container(
              //                                     margin:
              //                                         EdgeInsets.only(top: 10),
              //                                     child: Theme(
              //                                       data: new ThemeData(
              //                                         primaryColor:
              //                                             textFieldTapColor,
              //                                       ),
              //                                       child: TextField(
              //                                         controller: controller
              //                                             .remarkTextController,
              //                                         decoration:
              //                                             InputDecoration(
              //                                           border:
              //                                               OutlineInputBorder(),
              //                                           hintText:
              //                                               labels?.remark,
              //                                         ),
              //                                         onChanged: (text) {},
              //                                       ),
              //                                     )),
              //                                 Padding(
              //                                   padding: const EdgeInsets.only(
              //                                       top: 14.0),
              //                                   child: GFButton(
              //                                     onPressed: () {
              //                                       if (_formKey.currentState
              //                                           .validate()) {
              //                                         _formKey.currentState
              //                                             .save();
              //                                       }
              //                                       Navigator.of(context).pop();
              //                                       controller.addExpenseLine();
              //                                     },
              //                                     text: "Add",
              //                                     blockButton: true,
              //                                     size: GFSize.LARGE,
              //                                   ),
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   );
              //                 });
              //           },
              //           text: labels.addAdvanceLine,
              //           color: textFieldTapColor,
              //           icon: Icon(
              //             Icons.add,
              //             color: Colors.white,
              //           ),
              //           shape: GFButtonShape.pills,
              //           blockButton: true,
              //         )
              //       : new Container(),
              // ),
              // Divider(
              //   thickness: 1,
              // ),
              // Obx(
              //   () => controller.expenseList.length > 0
              //       ? expenseTitleWidget(context)
              //       : new Container(),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // expenseWidget(context),
              // SizedBox(
              //   height: 10,
              // ),
              // Align(
              //     alignment: Alignment.center,
              //     child: Container(
              //         margin: EdgeInsets.symmetric(horizontal: 18),
              //         child: Obx(() => Text(
              //               '${labels?.total} Amount : ${numberFormat.format(controller.totalAmount.value)}',
              //               style: TextStyle(
              //                   fontSize: 20, color: Colors.deepPurple),
              //             )))),

              // SizedBox(
              //   height: 20,
              // ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Obx(
              //     () => Container(
              //       width: double.infinity,
              //       height: 45,
              //       margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              //       child: controller.save_btn_show.value
              //           ? GFButton(
              //               color: textFieldTapColor,
              //               onPressed: () {
              //                 if (controller.checkIsNotEmptyDestination()) {
              //                   if (controller.checkIsNotEmptyPurpose()) {
              //                     if (controller.expenseList.length == 0) {
              //                       showAlertDialog(context);
              //                     } else {
              //                       if (_formKeyParent.currentState
              //                           .validate()) {
              //                         controller.requestTravelRequest(
              //                             controller.durationController.text);
              //                       }
              //                     }
              //                   } else {
              //                     AppUtils.showDialog(
              //                         'Warning!', 'Purpose is require.');
              //                   }
              //                 } else {
              //                   AppUtils.showDialog(
              //                       'Warning!', 'Desination is require.');
              //                 }
              //               },
              //               text: labels.save,
              //               blockButton: true,
              //               size: GFSize.LARGE,
              //             )
              //           : new Container(),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: double.infinity,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: GFButton(
                      color: kButtonColor,
                      onPressed: () {},
                      text: "Save",
                      blockButton: true,
                      size: GFSize.LARGE,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
