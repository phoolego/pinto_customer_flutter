class UserAddress{
  int id = 0;
  String addressName = '';
  String address = '';
  bool inUser = false;

  UserAddress(Map<String,dynamic> json){
    id = json['id'];
    addressName = json['address_name'];
    address = json['address'];
    inUser = json['in_use']==1 ?true:false ;
  }
}