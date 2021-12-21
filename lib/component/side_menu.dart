import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/order.dart';
// import 'package:pinto_farmer_flutter/screen/farmer_product_sale_Page.dart';
import 'package:pinto_customer_flutter/service/auth.dart';


class SideMenu extends StatelessWidget {

String? firstName = '';
String? lastName = '';
String currentPage='หน้าหลัก';

SideMenu.defaultMenu(String currentPage){
  this.firstName = Auth.user.firstname;
  this.lastName = Auth.user.lastname;
  this.currentPage = currentPage;
}
SideMenu.withoutAny(){
  this.firstName = Auth.user.firstname;
  this.lastName = Auth.user.lastname;
}
SideMenu({this.firstName, this.lastName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                    Text(
                      '$firstName \n$lastName',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('หน้าหลัก',style: kContentTextBlack,),
              onTap: (){
                if(currentPage=='หน้าหลัก'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacementNamed(context, '/home',);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('ตะกร้า (${Order.basket.length})',style: kContentTextBlack),
              onTap: (){
                if(currentPage=='ตะกร้า'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacementNamed(context, '/basket',);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('โปรไฟล์ของฉัน',style: kContentTextBlack),
              onTap: (){
                if(currentPage=='โปรไฟล์ของฉัน'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacementNamed(context, '/profile',);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ',style: kContentTextBlack),
              onTap: ()async {
                await Auth.logout();
                Navigator.pushReplacementNamed(context,'/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
