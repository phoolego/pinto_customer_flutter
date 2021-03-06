import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/preorder_card.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/pre_order.dart';
import 'package:pinto_customer_flutter/service/pre_order_service.dart';

class PreOrderPage extends StatefulWidget {
  String? status = '';
  PreOrderPage({required this.status,
  });
  @override
  State<PreOrderPage> createState() => _PreOrderPageState();
}

class _PreOrderPageState extends State<PreOrderPage> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'สินค้าที่สั่งจอง',
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
          child: FutureBuilder<List<PreOrder>>(
              future: PreOrderService.getPreOrder(widget.status),
              builder: (BuildContext context, AsyncSnapshot<List<PreOrder>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else {
                  List<PreOrder> listPreOrder = snapshot.data!;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: listPreOrder.length,
                          padding: EdgeInsets.only(bottom:screenHeight * 0.05),
                          itemBuilder: (context,index)=>
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                              child: PreOrderCard(
                                preOrder: listPreOrder[index],
                                operation: (){
                                  setState(() {
                                    print('reload PreOrderPage');
                                  });
                                },
                              )
                            ),
                        ),
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
