import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ternakin/pages/Login_page.dart';
import 'package:ternakin/pages/home_page.dart';
import 'package:ternakin/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.LoginAccount);
      print(emailController);

      Map body = {
        'email': emailController.text,
        'password': passwordController.text
      };

      // Map body = {'email': "test@mail.com", 'password': "12345789"};

      print(jsonEncode(body));

      print(url);
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['data']['token'];
        print(token['token']);
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', token['token']);

        emailController.clear();
        passwordController.clear();
        Get.off(const HomePage());
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> Register() async {
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
          Get.off(const LoginPage());
        } else {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      print(error);
    }
  }
}
