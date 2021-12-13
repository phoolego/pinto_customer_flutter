import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/model/order_item.dart';
import 'package:pinto_customer_flutter/model/product.dart';
import 'package:pinto_customer_flutter/model/product_preview.dart';
import 'package:pinto_customer_flutter/service/date_format.dart';
import 'package:pinto_customer_flutter/service/pre_order_service.dart';
import 'package:pinto_customer_flutter/service/product_service.dart';

class AddPreOrder extends StatefulWidget {
  ProductPreview product;
  AddPreOrder({Key? key,required this.product}) : super(key: key);

  @override
  _AddPreOrderState createState() => _AddPreOrderState();
}

class _AddPreOrderState extends State<AddPreOrder> {

  final _formKey = GlobalKey<FormState>();
  double _amount = 0;
  double _price = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'จองผลิตภัณฑ์',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<Product>(
          future: ProductService.getPreOrderProductDetail(widget.product.name),
          builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              Product product = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: lightGrayBackground,
                      height: screenHeight * 0.3,
                      width: screenWidth,
                      child: product.picUlr==null?Image.asset('assets/images/Icons.jpg'):Image.network(product.picUlr!,fit: BoxFit.cover),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      margin: EdgeInsets.all(screenWidth * 0.05),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                      decoration: kCardDecoration,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ชื่อสินค้า: ${product.name}',
                              style: kContentTextBlack,
                            ),
                            Text(
                              'ราคา:  ${product.priceSell} บาท/${product.unit}',
                              style: kContentTextBlack,
                            ),
                            Text(
                              'ปริมาณคงเหลือ:  ${product.amount} ${product.unit}',
                              style: kContentTextBlack,
                            ),
                            Text(
                              'เริ่มเก็บเกี่ยว ${DateFormat.getFullDate(product.predictHarvestDate!)}',
                              style: kContentTextBlack,
                            ),
                            SizedBox(height: screenHeight * 0.02,),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'ปริมาณที่ต้องการ',
                                    style: kContentTextBlack,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.zero,
                                  child: TextFormField(
                                    initialValue: _amount==0?'':_amount.toString(),
                                    decoration: InputDecoration(
                                      suffix: Text(product.unit),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'กรุณากรอกปริมาณที่ต้องการ';
                                      } else if (num.tryParse(val) == null ||
                                          double.parse(val) <= 0) {
                                        return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                                      } else if(double.parse(val) > product.amount){
                                        return 'ผลิตภัณฑ์ไม่เพียงพอ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (val) {
                                      if (num.tryParse(val) != null && double.parse(val) >= 0) {
                                        setState(() {
                                          _amount = double.parse(val);
                                          _price = _amount * product.priceSell;
                                        });
                                      }else{
                                        setState(() {
                                          _price = 0;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.01,),
                            Text(
                              'เป็นเงิน:  $_price บาท',
                              style: kContentTextBlack,
                            ),
                            SizedBox(height: screenHeight * 0.01,),
                            Center(
                              child: PintoButton(
                                label: 'ยืนยัน',
                                buttonColor: deepGreen,
                                function: () async {
                                  if(_formKey.currentState!.validate()){
                                    await PreOrderService.insertPreOrder(product.name, product.predictHarvestDate!, _amount);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }
        ),
      )
    );
  }
}