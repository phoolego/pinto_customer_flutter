import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';

class OrderPayingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'คำสั่งซื้อที่ต้องชำระ',
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
                      // todo ทำการ์ดรายการสั่งซื้อ
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
