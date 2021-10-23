class Order {
  int orderId = 0;
  String paymentType = '';
  String status = '';
  bool isDelivery = false;
  DateTime date = DateTime.now();
  int userId = 0;

  Order(Map<String, dynamic> jsonOrder) {
    orderId = jsonOrder['order_id'] + 0;
    paymentType = jsonOrder['payment_type'];
    status = jsonOrder['status'];
    isDelivery = jsonOrder['is_delivery'];
    date = DateTime.parse(jsonOrder['date']);
    userId = jsonOrder['user_id'] + 0;
  }
}
