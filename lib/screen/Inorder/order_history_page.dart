import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/order_card.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/service/order_service.dart';

class OrderHistoryPage extends StatefulWidget {
  String status = '';
  OrderHistoryPage({required this.status,
  });
  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'ประวัติการสั่งซื้อ',
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
          child: FutureBuilder<List<Order>>(
              future: OrderService.getOrder(widget.status),
              builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else {
                  List<Order> listOrder = snapshot.data!;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: listOrder.length,
                          itemBuilder: (context,index)=>
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                                  child: OrderCard(
                                    // id: listOrder[index].orderId,
                                    // status: listOrder[index].status,
                                    // createdDate: listOrder[index].createdDate,
                                    order: listOrder[index],
                                    function: null,
                                  )
                              ),
                        ),
                      ),
                      // Center(
                      //   child: PintoButton(
                      //     width: 200,
                      //     label: 'เพิ่มหลักฐานการชำระเงิน',
                      //     buttonColor: lightGreen, function: () {
                      //     Navigator.pushNamed(context, '');
                      //   },
                      //   ),
                      // ),
                      SizedBox(
                        height: screenHeight * 0.1,
                      ),
                    ],
                  );
                }
              }
          )
      ),
    );
  }
}
