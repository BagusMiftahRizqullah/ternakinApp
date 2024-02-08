import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ternakin/pages/Login_page.dart';
import 'package:ternakin/pages/Order_page.dart';
import 'package:ternakin/pages/Register_page.dart';
import 'package:ternakin/pages/bottom_page.dart';
import 'package:ternakin/pages/home_page.dart';
import 'package:ternakin/pages/splash_page.dart';
import 'package:ternakin/pages/welcome_page.dart';

void main() => runApp(TernakinApp());

class TernakinApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
                home: const SplashPage(),
                routes: {
                  // '/splash': (context) => const SplashPage(),
                  '/WelcomePage': (context) => const WelcomePage(),
                  '/HomePage': (context) => const HomePage(),
                  '/LoginPage': (context) => const LoginPage(),
                  '/RegisterPage': (context) => const RegisterPage(),
                  '/OrderPage': (context) => const OrderPage(),
                  '/BottomPage': (context) => const BottomPage(),
                }));
  }
}
