import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_customer_flutter/screen/search_page.dart';
import 'package:pinto_customer_flutter/screen/auth/login.dart';

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
        // '/register': (context) => Register(),
        '/search': (context) => Search(),

      },
    );
  }
}