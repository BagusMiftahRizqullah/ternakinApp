import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:berternak/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class BerternakController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getCategoriesBerternak(context) async {
    EasyLoading.show(status: 'Please wait...');

    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.berternakEndpoints.CategoriesBerternak);

      print(url);
      http.Response response = await http.get(url, headers: headers);

      // print(response.statusCode);
      // print(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        print(json);

        final SharedPreferences? prefs = await _prefs;

        print(jsonEncode(json['data']));
        await prefs?.setString(
            'categories_berternak', jsonEncode(json['data']));

        EasyLoading.dismiss();
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
}
