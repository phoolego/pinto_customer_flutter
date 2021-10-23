import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';

class OrderDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // Order order;
    int orderId = 123456;
    String status = 'status';
    double priceOrder = 300;
    double shipping =20;
    double total = 320;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'รายการสั่งซื้อที่ $orderId',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'สถานะสินค้า: $status',
                              textAlign: TextAlign.left,
                              style: kContentTextBlackBold,
                            ),
                            Text(
                              //date,time,detail of status
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum arcu eget '
                              'nulla elementum, scelerisque elementum ligula porttitor. In ac convallis augue. Etiam '
                              'ac mauris viverra diam ultricies dapibus a a sapien.',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 5,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ที่อยู่จัดส่ง',
                              textAlign: TextAlign.left,
                              style: kContentTextBlackBold,
                            ),
                            Text(
                              //date,time,detail of status
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum arcu eget '
                              'nulla elementum, scelerisque elementum ligula porttitor. In ac convallis augue. Etiam '
                              'ac mauris viverra diam ultricies dapibus a a sapien.',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 3,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      // todo ทำการ์ดสินค้า
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'รวมราคาสินค้า',
                                  style: kContentTextBlack,
                                ),
                                Text(
                                  'ค่าส่ง',
                                  style: kContentTextBlack,
                                ),
                                Text(
                                  'รวมราคาที่ต้องชำระ',
                                  style: kContentTextBlackBold,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '$priceOrder',
                                  style: kContentTextBlack,
                                ),
                                Text(
                                  '$shipping',
                                  style: kContentTextBlack,
                                ),
                                Text(
                                  '$total',
                                  style: kContentTextBlackBold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ช่องทางชำระเงิน', //$transition type
                              textAlign: TextAlign.left,
                              style: kContentTextBlackBold,
                            ),
                            Text(
                              //date,time,detail of status
                              'โอน SCB xx-xxx-xxx-201',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 3,
                              softWrap: true,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Image.asset('assets/images/Icons.jpg'),
                            ),
                          ],
                        ),
                      ),
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
