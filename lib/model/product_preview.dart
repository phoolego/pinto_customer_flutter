class ProductPreview {
  String name = '';
  String nameEng = '';
  double amount = 0;
  double priceSell = 0;
  String unit = '';
  String? picUlr = '';
  String sellType = '';
  DateTime? predictHarvestDate;

  ProductPreview(Map<String,dynamic> jsonProductPreview){
    name = jsonProductPreview['name'];
    nameEng = jsonProductPreview['name_eng'];
    amount = (jsonProductPreview['pre_order_amount'] ?? jsonProductPreview['selling_amount']) + 0.0;
    priceSell = jsonProductPreview['price_sell']+0.0;
    unit = jsonProductPreview['unit'];
    picUlr = jsonProductPreview['picture_of_product'];
    sellType = jsonProductPreview['sell_type'];
    predictHarvestDate = jsonProductPreview['predict_harvest_date']!=null?DateTime.parse(jsonProductPreview['predict_harvest_date']).toLocal():null;
  }
}