import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';

class InmarketProductCard extends StatelessWidget {
  String productName = '';
  int statusNumber = 0;
  String statusText = 'มีข้อผผิดพลาด';
  TextStyle statusTextStyle = kStatusNotCompleteTextColor;
  String buttonText = '';
  String farmName = '';
  int productId;
  var functionCard;
  var functionBasket;
  var functionOrdering;

  InmarketProductCard(
      {required this.productId,
      required this.productName,
      required this.statusNumber,
      required this.farmName,
      required this.functionCard,
      required this.functionBasket,
      required this.functionOrdering});
  //CustomerProductCard.withImage({required this.productName,required this.statusNumber, required this.farmName});

  void checkStatus(int statusNumber) {
    if (statusNumber == 1) {
      statusText = 'สินค้าต้องสั่งจอง';
      statusTextStyle = kStatusWaitingTextColor;
      buttonText = 'สั่งจอง';
      print(statusNumber);
      print(statusText);
    } else if (statusNumber == 2) {
      statusText = 'สินค้าพร้อมส่ง';
      statusTextStyle = kStatusCompleteTextColor;
      buttonText = 'สั่งซื้อ';
      print(statusNumber);
      print(statusText);
    } else
      (print('something error'));
  }

  @override
  Widget build(BuildContext context) {
    checkStatus(statusNumber);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: functionCard,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: mediumGrayBackground,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Container(
          //width: screenWidth* 1,
          child: Column(
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: kHeadingTextStyle,
                    ),
                    Text(
                      farmName,
                      style: kContentTextBlack,
                    ),
                  ],
                ),
                subtitle: Text(
                  statusText,
                  style: statusTextStyle,
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                color: lightGrayBackground,
                height: screenHeight * 0.3,
                width: screenWidth * 0.8,
                child: Image.asset('assets/images/Icons.jpg'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'ใส่ตะกร้า',
                      style: kContentTextBlack,
                    ),
                    onPressed: functionBasket,
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: Text(
                      buttonText,
                      style: kContentTextBlack,
                    ),
                    onPressed: functionOrdering,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
