import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/in_basket_product_card.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'ตะกร้าสินค้า',
          style: kAppbarTextStyle,
        ),
      ),
      floatingActionButton: PintoButton(
        function:(){},
        buttonColor: deepGreen,
        label: 'สั่งซื้อ'
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Order.basket.length,
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                    child: InbasketProductCard(orderItem: Order.basket[index],function: (){},),
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}
