import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/in_basket_product_card.dart';
import 'package:pinto_customer_flutter/constant.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'ตะกร้าสินค้า',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    children: [
                      // todo ทำการ์ดสินค้า
                      InbasketProductCard(productName: 'ผักกาดขาว',function: (){},),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
