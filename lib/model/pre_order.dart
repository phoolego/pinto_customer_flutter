class PreOrder {
  int ppoId = 0;
  int userId = 0;
  String status = '';
  double amount = 0.0;
  double price = 0.0;
  DateTime? sellingDate;
  String productType = '';
  String? productPic = '';
  String unit = '';

  PreOrder(Map<String, dynamic> jsonOrderItem) {
    ppoId = jsonOrderItem['ppo_id'] + 0;
    userId = jsonOrderItem['user_id'] + 0;
    status = jsonOrderItem['status'];
    amount = jsonOrderItem['amount'] + 0.0;
    price = jsonOrderItem['price_sell'] + 0.0;
    sellingDate = jsonOrderItem['selling_date']!=null?DateTime.parse(jsonOrderItem['selling_date']).toLocal():null;
    productType = jsonOrderItem['type_of_product'];
    productPic = jsonOrderItem['picture_of_product'];
    unit = jsonOrderItem['unit'];
  }
  String getStatus(){
    if(status=='ACTIVE'){
      return 'รอผลิตภัณฑ์';
    }else if(status=='WAIT'){
      return 'รอการยืนยันการสั่งซื้อ';
    }else{
      return '';
    }
  }
}