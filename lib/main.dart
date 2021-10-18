import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/screen/auth/Register_page.dart';
import 'package:pinto_customer_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_customer_flutter/screen/homepage.dart';
import 'package:pinto_customer_flutter/screen/auth/login.dart';
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

      },
    );
  }
}