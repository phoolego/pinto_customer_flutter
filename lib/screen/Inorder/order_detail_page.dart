import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/in_basket_product_card.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/model/order_item.dart';
import 'package:pinto_customer_flutter/service/auth.dart';
import 'package:pinto_customer_flutter/service/order_service.dart';

class OrderDetailPage extends StatefulWidget {
  Order order;
  OrderDetailPage({required this.order});
  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // Order order;
    double totalPrice = 0.0;
    for (int i = 0; i < widget.order.orderItems.length; i++) {
      totalPrice += widget.order.orderItems[i].price;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'รายการสั่งซื้อที่ ${widget.order.orderId}',
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
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              Text(
                'สถานะ : ${widget.order.getStatus()}',
                style: kHeadingTextStyle,
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                'จัดส่งไปที่ : ${widget.order.destination}',
                style: kHeadingTextStyle,
              ),
              Divider(
                thickness: 2,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.order.orderItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${widget.order.orderItems[index].productType}',
                                    style: kContentTextBlack),
                                Text(
                                  '${widget.order.orderItems[index].amount} ${widget.order.orderItems[index].unit}',
                                  style: kContentTextBlack,
                                )
                              ],
                            ),
                            Text(
                              '${widget.order.orderItems[index].price} บาท',
                              style: kContentTextBlack,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ค่าจัดส่ง :',
                    style: kContentTextBlack,
                  ),
                  Text(
                    '${widget.order.deliveryPrice} บาท',
                    style: kContentTextBlack,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'รวมการสั่งซื้อ : ',
                    style: kContentTextBlackBold,
                  ),
                  Text(
                    '${totalPrice + widget.order.deliveryPrice} บาท',
                    style: kContentTextBlackBold,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Center(
                  child: widget.order.status == 'WAIT'
                      ? PintoButton(
                          width: 200,
                          label: 'เพิ่มหลักฐานการชำระเงิน',
                          buttonColor: lightGreen,
                          function: () {
                            Navigator.pushNamed(context, '');
                          },
                        )
                      : SizedBox()),
              SizedBox(
                height: screenHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
