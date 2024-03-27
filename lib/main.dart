import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:berternak/pages/Login_page.dart';
import 'package:berternak/pages/Order_page.dart';
import 'package:berternak/pages/Register_page.dart';
import 'package:berternak/pages/tt_categorie_selection.dart';
import 'package:berternak/widgets/bottom_page.dart';
import 'package:berternak/pages/home_page.dart';
import 'package:berternak/pages/splash_page.dart';
import 'package:berternak/pages/welcome_page.dart';

void main() {
  runApp(berternakApp());
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

class berternakApp extends StatelessWidget {
  String mytoken = '';
  berternakApp({super.key});

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('token') ?? '';
    // print(stringValue);

    if (stringValue == '') {
      // setState(() {
      //   mytoken = '';
      // });
      return false;
    } else {
      // setState(() {
      //   mytoken = stringValue;
      // });
      return true;
    }
  }

  @override
  Widget build(BuildContext contex) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
                builder: EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                title: 'berternak',
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                ),
                home: getStringValuesSF() != ''
                    ? const BottomPage()
                    : const SplashPage(),
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

  void setState(Null Function() param0) {}
}
