import 'package:pinto_customer_flutter/model/order_item.dart';

class Order {
  static List<OrderItem> basket = [];

  int orderId = 0;
  String paymentType = '';
  String status = '';
  String deliveryType = '';
  DateTime createdDate = DateTime.now();
  int userId = 0;
  String? tranPic;

  Order(Map<String, dynamic> jsonOrder) {
    orderId = jsonOrder['order_id'] + 0;
    paymentType = jsonOrder['payment_type'];
    status = jsonOrder['status'];
    deliveryType = jsonOrder['delivery_type'];
    createdDate = DateTime.parse(jsonOrder['created_date']);
    userId = jsonOrder['user_id'] + 0;
    tranPic = jsonOrder['tran_pic'];
  }
}
