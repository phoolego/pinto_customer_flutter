import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';

class ProductDetailPage extends StatefulWidget {
  String productName = '';
  String farmName = '';
  double price;
  int status = 0;
  int productId;
  String unit;
  ProductDetailPage(
      {required this.productId,
      required this.productName,
      required this.farmName,
      required this.status,
      required this.price,
      required this.unit});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String statusText = '';
  var statusTextStyle;
  String buttonText = '';
  var buttonColor;
  void checkStatus(int statusNumber) {
    if (statusNumber == 1) {
      statusText = 'สินค้าต้องสั่งจอง';
      statusTextStyle = kStatusWaitingTextColor;
      buttonText = 'สั่งจอง';
      buttonColor = waitingDeepYellow;
      print(statusNumber);
      print(statusText);
    } else if (statusNumber == 2) {
      statusText = 'สินค้าพร้อมส่ง';
      statusTextStyle = kStatusCompleteTextColor;
      buttonText = 'สั่งซื้อ';
      buttonColor = deepGreen;
      print(statusNumber);
      print(statusText);
    } else
      (print('something error'));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    checkStatus(widget.status);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'รายละเอียดสินค้า',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.05, 0, screenWidth * 0.05, 20),
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //color: deepGrayBackground,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: <Widget>[
                        Container(
                          height: screenHeight * 0.4,
                          width: screenWidth * 0.5,
                          padding: EdgeInsets.all(5),
                          child: Image.asset('assets/images/Icons.jpg'),
                        ),
                        Container(
                          height: screenHeight * 0.4,
                          width: screenWidth * 0.5,
                          padding: EdgeInsets.all(5),
                          child: Image.asset('assets/images/Icons.jpg'),
                        ),
                        Container(
                          height: screenHeight * 0.4,
                          width: screenWidth * 0.5,
                          padding: EdgeInsets.all(5),
                          child: Image.asset('assets/images/Icons.jpg'),
                        ),
                        Container(
                          height: screenHeight * 0.4,
                          width: screenWidth * 0.5,
                          padding: EdgeInsets.all(5),
                          child: Image.asset('assets/images/Icons.jpg'),
                        ),
                      ])),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                      screenHeight * 0.0075, screenWidth * 0.05, 0),
                  alignment: Alignment.topLeft,
                  decoration: kCardDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ชื่อสินค้า: ${widget.productName}',
                            style: kContentTextBlack,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.015),
                              child: Text(
                                statusText,
                                style: statusTextStyle,
                                textAlign: TextAlign.right,
                              ))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ชื่อฟาร์ม: ${widget.farmName}',
                            style: kContentTextBlack,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.05),
                              child: Text(''))
                        ],
                      ),
                      SizedBox(
                        height: screenWidth * 0.2,
                        child: Text('สถานะจะเหลือไว้อันเดียวดีไหม',style: kStatusNotCompleteTextColor,),
                      ),
                      Text(
                        'ราคา:  ${widget.price} บาท/${widget.unit}',
                        style: kContentTextBlack,
                      ),
                      Text(
                        statusText,
                        style: statusTextStyle,
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PintoButton.custom(
                            width: screenWidth * 0.3,
                            label: buttonText,
                            function: () {},
                            buttonColor: buttonColor,
                            textStyle: kContentTextWhite,
                          ),
                          PintoButton.custom(
                            width: screenWidth * 0.3,
                            label: 'ใส่ตะกร้า',
                            function: () {},
                            buttonColor: lightBlack,
                            textStyle: kContentTextWhite,
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
