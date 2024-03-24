import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:ternakin/controllers/berternak_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TTCategorieSelectionPage extends StatefulWidget {
  const TTCategorieSelectionPage({super.key});

  @override
  State<TTCategorieSelectionPage> createState() => _TTCategorieSelectionPage();
}

class _TTCategorieSelectionPage extends State<TTCategorieSelectionPage> {
  BerternakController berternakController = Get.put(BerternakController());
  final TextEditingController _controllerSearch =
      new TextEditingController(text: '');

  List CategorieBertenak = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    berternakController.getCategoriesBerternak(context);
    loadDataCategoriesBerternak();
  }

  loadDataCategoriesBerternak() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List data = await jsonDecode(prefs.getString('categories_berternak') ?? '');
    print(data);

    if (data == null) {
      setState(() {
        CategorieBertenak = [];
      });
    }

    setState(() {
      CategorieBertenak = data;
    });
  }

  List imglist = [
    "ternakin_logo",
    "books",
    "C#",
    "Flutter",
    "Python",
    "ReactNative",
  ];

  void _handleSearch(String input) {
    print(input);
    if (input.isEmpty) {
      loadDataCategoriesBerternak();
    } else {
      List newCategories = CategorieBertenak.where((value) => value
          .toString()
          .toLowerCase()
          .contains(input.toString().toLowerCase())).toList();
      setState(() {
        CategorieBertenak = newCategories;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 36, bottom: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 170, 19, 1),
            ),
            child: Row(
              children: [
                FadeInRight(
                  delay: const Duration(milliseconds: 900),
                  duration: const Duration(milliseconds: 1000),
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        IconlyBroken.arrow_left_circle,
                        color: Colors.white,
                        size: 53,
                      ),
                    ),
                  ]),
                ),
                FadeInRight(
                  child: Container(
                    margin: EdgeInsets.only(left: 28, top: 43, bottom: 20),
                    width: MediaQuery.of(context).size.width - 100,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      onChanged: _handleSearch,
                      cursorColor: Color.fromRGBO(0, 170, 19, 1),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search categorie.....",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                      height: 90.h,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(children: [
                        FadeInDown(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 1, left: 15, right: 15, bottom: 15),
                                child: Column(
                                  children: [
                                    GridView.builder(
                                      itemCount: CategorieBertenak.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio:
                                            (MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                    50 -
                                                    25) /
                                                (4 * 240),
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 10),
                                              decoration: BoxDecoration(
                                                // border: Border.all(
                                                //   color: Colors.grey.shade300,
                                                //   width: 5,
                                                // ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white70,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Image.asset(
                                                      "images/${imglist[index]}.png",
                                                      width: 100,
                                                      height: 100,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    CategorieBertenak?[index]
                                                        ?['name'],
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black
                                                          .withOpacity(0.6),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                ],
                                              )),
                                        );
                                      },
                                    ),
                                  ],
                                )))
                      ]))))
        ],
      ),
    );
  }
}
