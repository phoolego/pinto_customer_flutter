import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/side_menu.dart';
import 'package:pinto_customer_flutter/component/customer_product_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: SideMenu.withoutAny(),
        appBar: AppBar(
          backgroundColor: deepGreen,
          title: Text(
            'ปิ่นโต บางกะเจ้า',
            textAlign: TextAlign.left,
            style: kAppbarTextStyle,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                children: [
                  CustomerProductCard(
                    productName: 'ผักกาดขาว',
                    statusNumber: 1,
                  ),
                  CustomerProductCard(
                    productName: 'เห็ดบางกะเจ้า',
                    statusNumber: 2,
                  ),
                  CustomerProductCard(
                    productName: 'ผักกาดขาว',
                    statusNumber: 1,
                  ),
                  CustomerProductCard(
                    productName: 'เห็ดบางกะเจ้า',
                    statusNumber: 2,
                  ),
                  CustomerProductCard(
                    productName: 'ผักกาดขาว',
                    statusNumber: 1,
                  ),
                  CustomerProductCard(
                    productName: 'เห็ดบางกะเจ้า',
                    statusNumber: 2,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
