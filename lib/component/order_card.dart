import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_detail_page.dart';
import 'package:pinto_customer_flutter/service/date_format.dart';

class OrderCard extends StatelessWidget {
  Order order;
  var function;
  OrderCard({required this.order, required this.function});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderDetailPage(order: order)));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: screenWidth * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'รายการสั่งซื้อที่: ${order.orderId}',
                            textAlign: TextAlign.left,
                            style: kContentTextBlackBold,
                          ),
                          Text(
                            'วันที่สั่งซื้อ: ${DateFormat.getFullDate(order.createdDate)}',
                            textAlign: TextAlign.left,
                            style: kContentTextBlack,
                          ),
                          Text(
                            'สถานะ: ${order.getStatus()}',
                            textAlign: TextAlign.left,
                            style: kContentTextBlack,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // Text(
                //   'รายละเอียด',
                //   textAlign: TextAlign.right,
                //   style: kContentTextBlack,
                // )
              ],
            ),
            const Divider(
              // height: 20,
              thickness: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
