import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ternakin/pages/Login_page.dart';
import 'package:ternakin/pages/Order_page.dart';
import 'package:ternakin/pages/Register_page.dart';
import 'package:ternakin/pages/tt_categorie_selection.dart';
import 'package:ternakin/widgets/bottom_page.dart';
import 'package:ternakin/pages/home_page.dart';
import 'package:ternakin/pages/splash_page.dart';
import 'package:ternakin/pages/welcome_page.dart';

void main() {
  runApp(TernakinApp());
  configLoading();
}

void configLoading() {
  EasyLoadingStyle.custom;
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorColor = const Color.fromRGBO(0, 170, 19, 1)
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = const Color.fromARGB(255, 247, 247, 244)
    ..userInteractions = true
    ..dismissOnTap = false
    ..backgroundColor = Colors.transparent;
}

class TernakinApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
                builder: EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                title: 'Ternakin',
                theme: new ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                ),
                home: const SplashPage(),
                routes: {
                  // '/splash': (context) => const SplashPage(),
                  '/WelcomePage': (context) => const WelcomePage(),
                  '/HomePage': (context) => const HomePage(),
                  '/LoginPage': (context) => const LoginPage(),
                  '/RegisterPage': (context) => const RegisterPage(),
                  '/OrderPage': (context) => const OrderPage(),
                  '/BottomPage': (context) => const BottomPage(),
                  '/tt_category': (context) => const TTCategorieSelectionPage(),
                }));
  }
}
