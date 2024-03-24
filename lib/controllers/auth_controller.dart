import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:berternak/pages/Login_page.dart';
import 'package:berternak/pages/home_page.dart';
import 'package:berternak/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:berternak/widgets/bottom_page.dart';

class AuthController extends GetxController {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail(context) async {
    EasyLoading.show(status: 'Please wait...');

    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.LoginAccount);
      print(emailController.text);
      print(passwordController.text);

      Map body = {
        'email': emailController.text,
        'password': passwordController.text
      };

      // Map body = {'email': "test@mail.com", 'password': "12345789"};

      // print(jsonEncode(body));

      // print(url);
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      // print(response.statusCode);
      // print(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['data']['token'];
        print(json);
        Map dataProfile = {
          'fname': json['data']['detail']['fname'],
          'lname': json['data']['detail']['lname'],
          'email': json['data']['email'],
          'phone': json['data']['phone'],
        };
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', token['token']);
        await prefs?.setString('profile', jsonEncode(dataProfile));
        emailController.clear();
        passwordController.clear();
        EasyLoading.dismiss();
        Get.off(const BottomPage());
      } else {
        EasyLoading.dismiss();
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: jsonDecode(response.body)["message"]["en"] ??
              "Unknown Error Occured",
        );
        // throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      print(error);
      EasyLoading.dismiss();
    }
  }

  Future<void> Register() async {
    EasyLoading.show(status: 'Please wait...');
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.RegisterAccount);
      Map body = {
        'fname': fnameController.text.trim(),
        'lname': lnameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'password': passwordController.text
      };

      print(body);
      print(url);
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      print(response.statusCode);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emailController.clear();
          fnameController.clear();
          lnameController.clear();
          phoneController.clear();
          passwordController.clear();
          EasyLoading.dismiss();
          Get.off(const LoginPage());
        } else {
          EasyLoading.dismiss();
          throw jsonDecode(response.body)['message'];
        }
      } else {
        EasyLoading.dismiss();
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      EasyLoading.dismiss();
      print(error);
    }
  }
}
