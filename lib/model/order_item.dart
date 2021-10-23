class OrderItem {
  int orderItemId = 0;
  double amount = 0.0;
  int orderUnit = 0;
  int orderId = 0;
  int inventoryId = 0;

  OrderItem(Map<String, dynamic> jsonOrderItem) {
    orderItemId = jsonOrderItem['order_item_id'] + 0;
    amount = jsonOrderItem['amount'] + 0.0;
    orderUnit = jsonOrderItem['unit'] + 0;
    orderId = jsonOrderItem['order_id'] + 0;
    inventoryId = jsonOrderItem['inventory_id'] + 0;
  }
}
