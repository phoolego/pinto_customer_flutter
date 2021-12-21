class Inventory {
  int inventoryId = 0;
  double totalAmount = 0.0;
  double pricePerUnit = 0.0;
  String status = '';
  double currentAmount = 0.0;
  String? transitionPic;
  int productId = 0;

  Inventory(Map<String, dynamic> jsonInventory) {
    inventoryId = jsonInventory['inventory_id'] + 0;
    totalAmount = jsonInventory['total_amount'] + 0.0;
    pricePerUnit = jsonInventory['price_per_unit'] + 0.0;
    status = jsonInventory['status'];
    currentAmount = jsonInventory['current_amount'] + 0.0;
    transitionPic = jsonInventory['transition_pic'];
    productId = jsonInventory['product_id'] + 0;
  }
}
