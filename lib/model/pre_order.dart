class PreOrder {
  int ppoId = 0;
  int userId = 0;
  String status = '';
  double amount = 0.0;
  DateTime? sellingDate;
  String productType = '';

  PreOrder(Map<String, dynamic> jsonOrderItem) {
    ppoId = jsonOrderItem['ppoId'] + 0;
    userId = jsonOrderItem['user_id'] + 0;
    status = jsonOrderItem['status'];
    amount = jsonOrderItem['amount'] + 0.0;
    sellingDate = jsonOrderItem['selling_date']!=null?DateTime.parse(jsonOrderItem['selling_date']).toLocal():null;
    productType = jsonOrderItem['type_of_product'];
  }
}