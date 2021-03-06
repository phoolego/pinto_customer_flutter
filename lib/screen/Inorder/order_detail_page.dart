import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/screen/Inorder/transaction_upload.dart';

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
        child: SingleChildScrollView(
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
                ListView.builder(
                  itemCount: widget.order.orderItems.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                  }
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TransactionUpload(
                              orderId: widget.order.orderId,
                            ))
                          );
                        },
                      )
                    : const SizedBox()
                ),
                Center(
                    child: widget.order.tranPic != null ? Container(
                      width: screenWidth*0.8,
                      height: screenWidth*1.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(widget.order.tranPic!),
                        ),
                      ),
                    ):const SizedBox()
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
