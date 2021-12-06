import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/product.dart';
import 'package:pinto_customer_flutter/service/date_format.dart';
import 'package:pinto_customer_flutter/service/product_service.dart';

class ProductDetailPage extends StatefulWidget {
  int status = 0;
  String productName;
  ProductDetailPage({
    required this.productName,
    required this.status,
  });

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
    } else if (statusNumber == 2) {
      statusText = 'สินค้าพร้อมส่ง';
      statusTextStyle = kStatusCompleteTextColor;
      buttonText = 'สั่งซื้อ';
      buttonColor = deepGreen;
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
              screenWidth * 0.05, 0, screenWidth * 0.05, 0),
          child: FutureBuilder<Product>(
            future: widget.status==1?
              ProductService.getPreOrderProductDetail(widget.productName)
              :ProductService.getSellProductDetail(widget.productName),
            builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Product product = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
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
                                'ชื่อสินค้า: ${product.name}',
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
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'ชื่อฟาร์ม: ${widget.farmName}',
                          //       style: kContentTextBlack,
                          //     ),
                          //     Container(
                          //         padding:
                          //         EdgeInsets.only(right: screenWidth * 0.05),
                          //         child: Text(''))
                          //   ],
                          // ),
                          Text(
                            'ราคา:  ${product.priceSell} บาท/${product.unit}',
                            style: kContentTextBlack,
                          ),
                          Text(
                            'ปริมาณคงเหลือ:  ${product.amount} ${product.unit}',
                            style: kContentTextBlack,
                          ),
                          const Text(
                            'ฟาร์มผู้ผลิต',
                            style: kContentTextBlack,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: product.sourceFarmer.length,
                            itemBuilder: (context,index)=>Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.sourceFarmer[index].farmName,
                                    style: kContentTextBlack,
                                  ),
                                  Text(
                                    'ปลูกวันที่ ${DateFormat.getFullDate(product.sourceFarmer[index].plantDate)}',
                                    style: kContentTextBlack,
                                  ),
                                  Text(
                                    'เก็บเกี่ยววันที่ ${DateFormat.getFullDate(product.sourceFarmer[index].harvestDate)}',
                                    style: kContentTextBlack,
                                  ),
                                ],
                              ),
                            )),
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
                              product.sellType=='PRE-ORDER'? const SizedBox(width: 0,):PintoButton.custom(
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
              );
            }}
          )
        ),
      ),
    );
  }
}
