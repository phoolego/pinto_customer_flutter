import 'package:pinto_customer_flutter/model/order_item.dart';

class Order {
  int orderId = 0;
  String paymentType = '';
  String status = '';
  String deliveryType = '';
  String destination='';
  DateTime createdDate = DateTime.now();
  int userId = 0;
  double deliveryPrice = 0;
  List<OrderItem> orderItems = [];
  String? tranPic;

  Order(Map<String, dynamic> jsonOrder) {
    orderId = jsonOrder['order_id'] + 0;
    paymentType = jsonOrder['payment_type'];
    status = jsonOrder['status'];
    deliveryType = jsonOrder['delivery_type'];
    destination = jsonOrder['destination'];
    createdDate = DateTime.parse(jsonOrder['created_date']);
    userId = jsonOrder['user_id'] + 0;
    deliveryPrice = jsonOrder['delivery_price'] + 0.0;
    tranPic = jsonOrder['tran_pic'];
    orderItems = (jsonOrder['orderItem'] as List).map((e) => OrderItem(e)).toList();
  }

  String getStatus(){
    if(status=='WAIT'){
      return 'รอการชำระเงิน';
    }else if(status=='PAID'){
      return 'รอการตรวจสอบ';
    }else if(status=='VALIDATE'){
      return 'รอการจัดส่ง';
    }else if(status=='COMPLETE'){
      return 'เสร็จสิ้น';
    }else{
      return '';
    }
  }

  static List<OrderItem> basket = [];

  static void addToBasket(OrderItem orderItem){
    bool found = false;
    for(int i=0 ; i<basket.length ; i++){
      if(basket[i].ppoId==null || orderItem.ppoId==null){
        if(basket[i].ppoId==null && basket[i].productType==orderItem.productType){
          basket[i].amount = orderItem.amount;
          basket[i].price = orderItem.price;
          found = true;
          break;
        }
      }else{
        if(basket[i].ppoId==orderItem.ppoId){
          basket[i].amount = orderItem.amount;
          basket[i].price = orderItem.price;
          found = true;
          break;
        }
      }
    }
    if(!found){
      basket.add(orderItem);
    }
  }

  static OrderItem getBasketItem(String productType){
    for(int i=0 ; i<basket.length ; i++){
      if(basket[i].productType==productType && basket[i].ppoId==null){
        return basket[i];
      }
    }
    return OrderItem.basket(0, 0, '', '', null,null);
  }

  static void removeBasketItem(OrderItem orderItem){
    bool found = false;
    for(int i=0 ; i<basket.length ; i++){
      if(basket[i].ppoId==null || orderItem.ppoId==null){
        if(basket[i].ppoId==null && basket[i].productType==orderItem.productType){
          basket.remove(basket[i]);
        }
      }else{
        if(basket[i].ppoId==orderItem.ppoId){
          basket.remove(basket[i]);
        }
      }
    }
  }

  static bool isPreOrderInBasket(int ppoId){
    for(int i=0 ; i<basket.length ; i++){
      if(basket[i].ppoId == ppoId){
        return true;
      }
    }
    return false;
  }
}
