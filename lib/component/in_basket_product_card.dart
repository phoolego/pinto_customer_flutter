import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/model/order_item.dart';

class InbasketProductCard extends StatelessWidget {
  // ProductType product;
  var function;
  OrderItem orderItem;

  InbasketProductCard({
    required this.orderItem,
    required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: orderItem.picUrl!=null?Image.network(orderItem.picUrl!,fit: BoxFit.cover,):
              Image.asset('assets/images/Icons.jpg'),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${orderItem.productType}${orderItem.ppoId==null?'':' (รหัสการจอง ${orderItem.ppoId})'}',
                      style: kHeadingTextStyle,
                    ),
                    Text(
                      '${orderItem.amount} ${orderItem.unit}',
                      style: kHeadingTextStyle,
                    ),
                    Text(
                      '${orderItem.price} บาท',
                      style: kHeadingTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Order.removeBasketItem(orderItem);
                function();
              },
              child: Icon(Icons.close)
            )
          ],
        ),
      ],
    );
  }
}
