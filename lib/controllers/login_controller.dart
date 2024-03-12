import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ternakin/pages/home_page.dart';
import 'package:ternakin/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };

      print(body);
      print(url);
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      print(response.statusCode);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);

          emailController.clear();
          passwordController.clear();
          Get.off(const HomePage());
        } else if (json['code'] == 1) {
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