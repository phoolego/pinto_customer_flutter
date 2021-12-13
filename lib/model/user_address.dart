class UserAddress{
  int id = 0;
  String addressName = '';
  String address = '';
  bool inUse = false;

  UserAddress(Map<String,dynamic> json){
    id = json['id'];
    addressName = json['address_name'];
    address = json['address'];
    inUse = json['in_use']==1 ?true:false ;
  }
  UserAddress.empty();
}