import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/in_basket_product_card.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/component/side_menu.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';

class BasketPage extends StatefulWidget {
  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

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
      drawer: SideMenu.defaultMenu('ตะกร้า'),
      floatingActionButton: PintoButton(
        function:(){
          if(Order.basket.isNotEmpty){
            Navigator.pushNamed(context, '/purchase');
          }
        },
        buttonColor: deepGreen,
        label: 'สั่งซื้อ'
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Order.basket.isEmpty?
              const Center(child:Text('ไม่มีสินค้าในตะกร้า',style: kHeadingTextStyle,))
              :ListView.builder(
                itemCount: Order.basket.length,
                itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    child: InbasketProductCard(orderItem: Order.basket[index],function: (){
                      setState(() {
                        print('reload BasketPage');
                      });
                    },),
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
