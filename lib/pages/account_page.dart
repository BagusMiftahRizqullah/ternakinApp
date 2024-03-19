import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ternakin/pages/Login_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String nameController = "";
  String addresController = "";
  String phoneController = "";
  String emailController = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDataProfile();
  }

  Future<void> logout() async {
    final SharedPreferences? prefs = await _prefs;
    await prefs?.clear();
    Get.offAll(LoginPage());
  }

  loadDataProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = await jsonDecode(prefs.getString('profile') ?? '');
    print(data);

    if (data == null) {
      setState(() {
        nameController = '';
        addresController = '';
        phoneController = '';
        emailController = '';
      });
      return;
    }

    nameController = data['fname'] + " " + data['lname'];
    addresController = data['address'] ?? '';
    phoneController = data['phone'] ?? '';
    emailController = data['email'] ?? '';

    setState(() {
      nameController = nameController;
      addresController = addresController;
      phoneController = phoneController;
      emailController = emailController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.3,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffD6D6D6)),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                child: Column(
                  children: [
                    Row(children: [
                      Icon(Icons.person, size: 32),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        nameController,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(children: [
                      Icon(Icons.home_outlined, size: 32),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(addresController),
                    ]),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(children: [
                      Icon(Icons.phone, size: 32),
                      const SizedBox(
                        width: 18,
                      ),
                      Text("+" + phoneController),
                    ]),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(children: [
                      Icon(Icons.email, size: 32),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(emailController),
                    ]),
                    const SizedBox(
                      height: 180,
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                logout();
                              },
                              child: FadeInUp(
                                  delay: const Duration(milliseconds: 700),
                                  duration: const Duration(milliseconds: 800),
                                  child: Text('Log Out')),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Satoshi'),
                                  backgroundColor:
                                      Color.fromRGBO(205, 30, 30, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 16)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFieldWidget(String title, IconData iconData,
      TextEditingController controller, Function validator,
      {Function? onTap, bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            readOnly: readOnly,
            onTap: () => onTap!(),
            validator: (input) => validator(input),
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: () => onPressed(),
      child: Text(
        title,
      ),
    );
  }
}
