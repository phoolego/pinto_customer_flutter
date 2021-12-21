class DeliveryPrice{
  int dpId=0;
  String dpName='';
  String dpDescription='';
  double dpPrice=0.0;

  DeliveryPrice(Map<String,dynamic> json){
    dpId = json['dp_id'] + 0;
    dpName = json['dp_name'];
    dpDescription = json['dp_description'];
    dpPrice = json['dp_price'] + 0.0;
  }
}