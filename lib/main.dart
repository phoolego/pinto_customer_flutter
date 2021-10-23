import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_history_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_paying_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_pre_ordering_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_receiving_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_sending_page.dart';
import 'package:pinto_customer_flutter/screen/address_page.dart';
import 'package:pinto_customer_flutter/screen/auth/Register_page.dart';
import 'package:pinto_customer_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_customer_flutter/screen/basket_page.dart';
import 'package:pinto_customer_flutter/screen/homepage.dart';
import 'package:pinto_customer_flutter/screen/auth/login.dart';
import 'package:pinto_customer_flutter/screen/my_profile_page.dart';
import 'package:pinto_customer_flutter/screen/product_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => const AuthController(),
        '/login': (context) => Login(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        // '/home/ProductDetail' : (context) => ProductDetailPage(),
        '/profile': (context) => MyProfilePage(),
        '/address': (context) => AddressPage(),
        '/basket': (context) => BasketPage(),
        '/inorder/history': (context) => OrderHistoryPage(),
        '/inorder/pre-ordering': (context) => OrderPreOrdering(),
        '/inorder/paying': (context) => OrderPayingPage(),
        '/inorder/sending': (context) => OrderSendingPage(),
        '/inorder/receiving': (context) => OrderReceivingPage(),


      },
    );
  }
}