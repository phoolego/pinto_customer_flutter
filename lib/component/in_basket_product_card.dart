import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
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
    return InkWell(
      onTap: function,
      child: Container(
        height: 100,
        width: 500,
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    // child: Image.asset('assets/images/Icons.jpg'),
                    child: orderItem.picUrl!=null?Image.network(orderItem.picUrl!,fit: BoxFit.cover,):
                    Image.asset('assets/images/Icons.jpg'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderItem.productType,
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
                  Expanded(child: Text(' ')),
                  SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(child: Icon(Icons.chevron_right)),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
