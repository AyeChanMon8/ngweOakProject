// @dart=2.9

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ngwe_oak_project/controllers/cash_sale_controller.dart';
import 'package:ngwe_oak_project/controllers/credit_sale_controller.dart';
import 'package:ngwe_oak_project/models/customer.dart';
import 'package:ngwe_oak_project/models/product.dart';
import 'package:ngwe_oak_project/utils/constants.dart';

class CreditSaleCreatePage extends StatefulWidget {
  @override
  State<CreditSaleCreatePage> createState() => _CreditSaleCreatePageState();
}

class _CreditSaleCreatePageState extends State<CreditSaleCreatePage> {
  final CreditSaleController controller = Get.put(CreditSaleController());

  final _formKey = GlobalKey<FormState>();
  final _formKeyParent = GlobalKey<FormState>();
  String dropdownValue;
  String productDropdownValue = 'Coca-Cola';
  List catalogdata;

  @override
  void initState() {
    // TODO: implement initState
    //this.loadData();
    super.initState();
  }

  Future<String> loadData() async {
    var data = await rootBundle.loadString("assets/json/customer.json");
    setState(() {
      this.catalogdata = json.decode(data);
    });
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    print(this.catalogdata);
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
              Obx(() => Container(
                    height: 59,
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: kPrimaryColor,
                      ),
                      child: InputDecorator(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        child: DropdownButtonHideUnderline(
                          // child: DropdownButton(
                          //   items: controller.customerList.map((item) {
                          //     return new DropdownMenuItem(
                          //       child: new Text(item.name),
                          //       value: item.id.toString(),
                          //     );
                          //   }).toList(),
                          //   onChanged: (newVal) {
                          //     setState(() {
                          //       dropdownValue = newVal;
                          //     });
                          //   },
                          //   value: dropdownValue,
                          // ),
                          child: DropdownButton<Customer>(
                              hint: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Expense Category",
                                  )),
                              value: controller.selectedCustomer,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 30,
                              isExpanded: true,
                              onChanged: (Customer value) {
                                controller.onChangeCustomerDropdown(value);
                              },
                              items: controller.customerList
                                  .map((Customer customer) {
                                return DropdownMenuItem<Customer>(
                                  value: customer,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      customer.name,
                                      style: TextStyle(),
                                    ),
                                  ),
                                );
                              }).toList()),
                        ),
                      ),
                    ),
                  )),

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
                    controller: controller.priceListController,
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
                    controller: controller.paymentTermsController,
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
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder()),
                                            child: DropdownButtonHideUnderline(
                                              // child: DropdownButton<String>(
                                              //   isExpanded: true,
                                              //   // Step 3.
                                              //   value: productDropdownValue,
                                              //   // Step 4.
                                              //   items: <String>[
                                              //     'Coca-Cola',
                                              //     'Sunkist',
                                              //     'Max',
                                              //   ].map<DropdownMenuItem<String>>(
                                              //       (String value) {
                                              //     return DropdownMenuItem<
                                              //         String>(
                                              //       value: value,
                                              //       child: Text(
                                              //         value,
                                              //         style: TextStyle(
                                              //             fontSize: 16),
                                              //       ),
                                              //     );
                                              //   }).toList(),
                                              //   // Step 5.
                                              //   onChanged: (String newValue) {
                                              //     setState(() {
                                              //       productDropdownValue =
                                              //           newValue;
                                              //     });
                                              //   },
                                              // ),
                                              child: DropdownButton<Product>(
                                                  hint: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        "Product",
                                                      )),
                                                  value: controller
                                                      .selectedProduct,
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  iconSize: 30,
                                                  isExpanded: true,
                                                  onChanged: (Product value) {
                                                    controller
                                                        .onChangeProductDropdown(
                                                            value);
                                                  },
                                                  items: controller.productList
                                                      .map((Product product) {
                                                    return DropdownMenuItem<
                                                        Product>(
                                                      value: product,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Text(
                                                          product.name,
                                                          style: TextStyle(),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList()),
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
                                            blockButton: true,
                                            color: kButtonColor,
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
