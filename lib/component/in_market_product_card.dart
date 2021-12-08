import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/product_preview.dart';
import 'package:pinto_customer_flutter/screen/add_pre_order.dart';
import 'package:pinto_customer_flutter/screen/basket/add_to_basket.dart';
import 'package:pinto_customer_flutter/screen/product_detail_page.dart';
import 'package:pinto_customer_flutter/service/date_format.dart';

class InMarketProductCard extends StatelessWidget {
  int statusNumber = 0;
  String statusText = 'มีข้อผผิดพลาด';
  TextStyle statusTextStyle = kStatusNotCompleteTextColor;
  String buttonText = '';
  ProductPreview product;
  var functionCard;
  var functionBasket;
  var functionOrdering;

  InMarketProductCard({
    required this.product,
    required this.statusNumber,
    this.functionCard,
    this.functionBasket,
    this.functionOrdering
  });

  void checkStatus(int statusNumber) {
    if (statusNumber == 1) {
      statusText = 'สินค้าต้องสั่งจอง';
      statusTextStyle = kStatusWaitingTextColor;
      buttonText = 'สั่งจอง';
    } else if (statusNumber == 2) {
      statusText = 'สินค้าพร้อมส่ง';
      statusTextStyle = kStatusCompleteTextColor;
      buttonText = 'สั่งซื้อ';
    } else {
      (print('something error'));
    }
  }

  @override
  Widget build(BuildContext context) {
    checkStatus(statusNumber);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  productName: product.name,
                  status: product.sellType == 'PRE-ORDER' ?1:2,
                )
            )
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: mediumGrayBackground,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          children: [
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: kHeadingTextStyle,
                  ),
                  Text(
                    statusNumber==1? 'เริ่มเก็บเกี่ยว ${DateFormat.getFullDate(product.predictHarvestDate!)}':'',
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
              child: product.picUlr==null?Image.asset('assets/images/Icons.jpg'):Image.network(product.picUlr!,fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                statusNumber==1?const SizedBox():TextButton(
                  child: const Text(
                    'ใส่ตะกร้า',
                    style: kContentTextBlack,
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddToBasket(product: product,isGotoBasket: false,)
                        )
                    );
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: Text(
                    buttonText,
                    style: kContentTextBlack,
                  ),
                  onPressed: (){
                    if (statusNumber == 1){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPreOrder(product: product)
                          )
                      );
                    }else if (statusNumber == 2){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddToBasket(product: product,isGotoBasket: true,)
                          )
                      );
                    }
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
