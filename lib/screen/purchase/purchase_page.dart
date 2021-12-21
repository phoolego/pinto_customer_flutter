import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/delivery_price.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'package:pinto_customer_flutter/model/user_address.dart';
import 'package:pinto_customer_flutter/service/auth.dart';
import 'package:pinto_customer_flutter/service/order_service.dart';
import 'package:pinto_customer_flutter/service/user_address_service.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  // int shippingPrice =0;
  DeliveryPrice pickUp = DeliveryPrice({
    'dp_id': 1,
    'dp_name': 'มารับเอง',
    'dp_description': 'ลูกค้ามารับสินค้าเองที่ฟาร์ม',
    'dp_price': 0
  });
  DeliveryPrice deliver = DeliveryPrice({
    'dp_id': 2,
    'dp_name': 'จัดส่ง',
    'dp_description': 'จัดส่งสินค้าไปยังที่อยู่ของลูกค้า',
    'dp_price': 40
  });
  DeliveryPrice? shippingPrice;
  @override
  void initState() {
    super.initState();
    shippingPrice=pickUp;
  }

  UserAddress userAddress = UserAddress.empty();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double totalPrice = 0;
    for(int i=0 ; i<Order.basket.length ; i++){
      totalPrice += Order.basket[i].price;
    }
    totalPrice += shippingPrice!.dpPrice;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'การสั่งซื้อ',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth*0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<UserAddress>(
                future: UserAddressService.getDefaultAddress(),
                builder: (BuildContext context, AsyncSnapshot<UserAddress> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else {
                    userAddress = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('จัดส่งไปที่ : ${userAddress.addressName}',style: kHeadingTextStyle,),
                        Text('\t\t${userAddress.address}',style: kHeadingTextStyle,),
                      ],
                    );
                  }
                }
              ),
              const Divider(thickness: 2,),
              Expanded(
                child: ListView.builder(
                  itemCount: Order.basket.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${Order.basket[index].productType} ${Order.basket[index].amount} ${Order.basket[index].unit}',
                            style: kHeadingTextStyle
                          ),
                          Text('${Order.basket[index].price} บาท',style: kHeadingTextStyle,)
                        ],
                      ),
                    );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: pickUp,
                        groupValue: shippingPrice,
                        onChanged: (DeliveryPrice? val){
                          setState(() {
                            shippingPrice = val;
                          });
                        },
                      ),
                      Text(pickUp.dpName,style: kHeadingTextStyle,)
                    ],
                  ),
                  Text('${pickUp.dpPrice.toString()} บาท',style: kHeadingTextStyle,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: deliver,
                        groupValue: shippingPrice,
                        onChanged: (DeliveryPrice? val){
                          setState(() {
                            shippingPrice = val;
                          });
                        },
                      ),
                      Text(deliver.dpName,style: kHeadingTextStyle,)
                    ],
                  ),
                  Text('${deliver.dpPrice.toString()} บาท',style: kHeadingTextStyle,)
                ],
              ),
              SizedBox(height: screenHeight*0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ทั้งหมด',
                      style: kHeadingTextStyle
                  ),
                  Text('$totalPrice บาท',style: kHeadingTextStyle,)
                ],
              ),
              SizedBox(height: screenHeight*0.05),
              Center(
                child: PintoButton(
                  label: 'สั่งซื้อ',
                  function: () async {
                    try{
                      await OrderService.insertOrder('E-BANKING', shippingPrice!.dpName, shippingPrice!.dpPrice,userAddress.address);
                      Order.basket = [];
                      Navigator.popUntil(context, ModalRoute.withName('/basket'));
                      Navigator.pushReplacementNamed(context, '/profile');
                      Navigator.pushNamed(context, '/inorder/paying');
                    }catch(err){
                     print(err.toString());
                    }
                  },
                  buttonColor: deepGreen
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
