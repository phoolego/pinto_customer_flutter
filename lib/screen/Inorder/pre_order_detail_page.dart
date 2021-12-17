import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/model/order_item.dart';
import 'package:pinto_customer_flutter/model/pre_order.dart';
import 'package:pinto_customer_flutter/service/date_format.dart';
import 'package:pinto_customer_flutter/service/pre_order_service.dart';

class PreOrderDetailPage extends StatefulWidget {
  PreOrder preOrder;
  var operation;
  PreOrderDetailPage({Key? key,required this.preOrder,required this.operation}) : super(key: key);

  @override
  _PreOrderDetailPageState createState() => _PreOrderDetailPageState();
}

class _PreOrderDetailPageState extends State<PreOrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    PreOrder preOrder = widget.preOrder;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'รายการสั่งจองที่ ${preOrder.ppoId}',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                Text(
                  'สถานะ : ${preOrder.getStatus()}',
                  style: kHeadingTextStyle,
                ),
                const Divider(
                  thickness: 2,
                ),
                Text(
                  'วันที่คาดว่าจะเก็บเกี่ยว : ${DateFormat.getFullDate(preOrder.sellingDate!)}',
                  style: kHeadingTextStyle,
                ),
                const Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      preOrder.productType,
                      style: kContentTextBlack
                    ),
                    Text(
                      '${preOrder.amount} ${preOrder.unit}',
                      style: kContentTextBlack,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          'ราคาปัจจุบันต่อหน่วย',
                          style: kContentTextBlack
                      ),
                      Text(
                        '${preOrder.price} บาท',
                        style: kContentTextBlack,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ราคารวม : ',
                      style: kContentTextBlackBold,
                    ),
                    Text(
                      '${preOrder.amount * preOrder.price} บาท',
                      style: kContentTextBlackBold,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                preOrder.status=='WAIT'? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PintoButton(
                      width: 150,
                      label: 'ยกเลิกการจอง',
                      buttonColor: lightBlack,
                      function: () async {
                        await PreOrderService.cancelPreOrder(preOrder.ppoId);
                        widget.operation();
                        Navigator.pop(context);
                      },
                    ),
                    Order.isPreOrderInBasket(preOrder.ppoId)?PintoButton(
                      width: 150,
                      label: 'ดูตะกร้า',
                      buttonColor: lightGreen,
                      function: () {
                        Navigator.popUntil(context, ModalRoute.withName('/profile'));
                        Navigator.pushReplacementNamed(context, '/basket');
                      },
                    ):PintoButton(
                      width: 150,
                      label: 'เพิ่มลงตะกร้า',
                      buttonColor: lightGreen,
                      function: () {
                        setState(() {
                          Order.addToBasket(OrderItem.basket(
                            preOrder.amount,
                            preOrder.amount * preOrder.price,
                            preOrder.productType,
                            preOrder.unit,
                            preOrder.productPic,
                            preOrder.ppoId)
                          );
                        });
                      },
                    )
                  ],
                ):Center(
                  child: PintoButton(
                    width: 150,
                    label: 'ยกเลิกการจอง',
                    buttonColor: lightBlack,
                    function: () async {
                      await PreOrderService.cancelPreOrder(preOrder.ppoId);
                      widget.operation();
                      Navigator.pop(context);
                    },
                  ),
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
