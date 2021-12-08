import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/screen/Inorder/OrderConfirmingPage.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_detail_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_history_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_paying_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_pre_ordering_page.dart';
import 'package:pinto_customer_flutter/screen/Inorder/order_sending_page.dart';
import 'package:pinto_customer_flutter/screen/address_create_page.dart';
import 'package:pinto_customer_flutter/screen/address_page.dart';
import 'package:pinto_customer_flutter/screen/auth/register_page.dart';
import 'package:pinto_customer_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_customer_flutter/screen/basket/basket_page.dart';
import 'package:pinto_customer_flutter/screen/homepage.dart';
import 'package:pinto_customer_flutter/screen/auth/login.dart';
import 'package:pinto_customer_flutter/screen/my_profile_edit_page.dart';
import 'package:pinto_customer_flutter/screen/my_profile_page.dart';
import 'package:pinto_customer_flutter/screen/purchase/purchase_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthController(),
        '/login': (context) => Login(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        // '/home/ProductDetail' : (context) => ProductDetailPage(),
        '/profile': (context) => MyProfilePage(),
        '/profile/edit': (context) => MyProfileEditPage(),
        '/address': (context) => AddressPage(),
        '/address/create': (context) => AddressCreatePage(),
        '/basket': (context) => BasketPage(),
        '/inorder/history': (context) => OrderHistoryPage(status:'COMPLETE'),
        '/inorder/detail': (context) => OrderDetailPage(),
        '/inorder/pre-ordering': (context) => OrderPreOrdering(),
        '/inorder/paying': (context) => OrderPayingPage(status:'WAIT'),
        '/inorder/confirming': (context) => OrderConfirmingPage(status:'PAID'),
        '/inorder/sending': (context) => OrderSendingPage(status:'VALIDATE'),
        '/purchase': (context) => PurchasePage(),
      },
    );
  }
}