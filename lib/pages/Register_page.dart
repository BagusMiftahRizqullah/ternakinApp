import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var focusNodeEmail = FocusNode();
  var focusNodePassword = FocusNode();
  var focusNodeFirstName = FocusNode();
  var focusNodeSecondName = FocusNode();
  var focusNodeNoTelephone = FocusNode();

  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  bool isFocusedFirstName = false;
  bool isFocusedSecondName = false;
  bool isFocusedNoTelephone = false;

  @override
  void initState() {
    // TODO: implement initState
    focusNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = focusNodeEmail.hasFocus;
      });
    });
    focusNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = focusNodePassword.hasFocus;
      });
    });

    focusNodeFirstName.addListener(() {
      setState(() {
        isFocusedFirstName = focusNodeFirstName.hasFocus;
      });
    });

    focusNodeSecondName.addListener(() {
      setState(() {
        isFocusedSecondName = focusNodeSecondName.hasFocus;
      });
    });

    focusNodeNoTelephone.addListener(() {
      setState(() {
        isFocusedNoTelephone = focusNodeNoTelephone.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(milliseconds: 1000),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          IconlyBroken.arrow_left,
                          size: 3.6.h,
                        )),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDown(
                          delay: const Duration(milliseconds: 800),
                          duration: const Duration(milliseconds: 900),
                          child: Text(
                            'Let\'s Sign up for Ternakin',
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        FadeInDown(
                          delay: const Duration(milliseconds: 600),
                          duration: const Duration(milliseconds: 700),
                          child: Text(
                            'Welcome to Ternakin',
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0.8.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                      decoration: BoxDecoration(
                          color: isFocusedFirstName
                              ? const Color.fromRGBO(255, 255, 255, 1)
                              : Color(0xFFF1F0F5),
                          border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedFirstName)
                              BoxShadow(
                                  color: Color.fromRGBO(0, 170, 19, 1)
                                      .withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0
                                  // Glow Color
                                  )
                          ]),
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your First Name'),
                        focusNode: focusNodeFirstName,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      'Second Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0.8.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                      decoration: BoxDecoration(
                          color: isFocusedSecondName
                              ? const Color.fromRGBO(255, 255, 255, 1)
                              : Color(0xFFF1F0F5),
                          border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedSecondName)
                              BoxShadow(
                                  color: Color.fromRGBO(0, 170, 19, 1)
                                      .withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0
                                  // Glow Color
                                  )
                          ]),
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your Second Name'),
                        focusNode: focusNodeSecondName,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      'No Telephone',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0.8.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                      decoration: BoxDecoration(
                          color: isFocusedNoTelephone
                              ? const Color.fromRGBO(255, 255, 255, 1)
                              : Color(0xFFF1F0F5),
                          border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedNoTelephone)
                              BoxShadow(
                                  color: Color.fromRGBO(0, 170, 19, 1)
                                      .withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0
                                  // Glow Color
                                  )
                          ]),
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your NoTelephone'),
                        focusNode: focusNodeNoTelephone,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // FadeInDown(
                  //   delay: const Duration(milliseconds: 700),
                  //   duration: const Duration(milliseconds: 800),
                  //   child: const Text(
                  //     'Email',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  // FadeInDown(
                  //   delay: const Duration(milliseconds: 600),
                  //   duration: const Duration(milliseconds: 700),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(vertical: 0.8.h),
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                  //     decoration: BoxDecoration(
                  //         color:
                  //             isFocusedEmail ? Colors.white : Color(0xFFF1F0F5),
                  //         border:
                  //             Border.all(width: 1, color: Color(0xFFD2D2D4)),
                  //         borderRadius: BorderRadius.circular(12),
                  //         boxShadow: [
                  //           if (isFocusedEmail)
                  //             BoxShadow(
                  //                 color:   Color.fromRGBO(0, 170, 19, 1).withOpacity(.3),
                  //                 blurRadius: 4.0,
                  //                 spreadRadius: 2.0
                  //                 // Glow Color
                  //                 )
                  //         ]),
                  //     child: TextField(
                  //       style: TextStyle(fontWeight: FontWeight.w500),
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none, hintText: 'Your Email'),
                  //       focusNode: focusNodeEmail,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // FadeInDown(
                  //   delay: const Duration(milliseconds: 500),
                  //   duration: const Duration(milliseconds: 600),
                  //   child: const Text(
                  //     'Password',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  // FadeInDown(
                  //   delay: const Duration(milliseconds: 400),
                  //   duration: const Duration(milliseconds: 500),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(vertical: 0.8.h),
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                  //     decoration: BoxDecoration(
                  //         color: isFocusedPassword
                  //             ? Colors.white
                  //             : Color(0xFFF1F0F5),
                  //         border:
                  //             Border.all(width: 1, color: Color(0xFFD2D2D4)),
                  //         borderRadius: BorderRadius.circular(12),
                  //         boxShadow: [
                  //           if (isFocusedPassword)
                  //             BoxShadow(
                  //                 color:  Color.fromRGBO(0, 170, 19, 1)
                  //                     .withOpacity(.3),
                  //                 blurRadius: 4.0,
                  //                 spreadRadius: 2.0
                  //                 // Glow Color
                  //                 )
                  //         ]),
                  //     child: TextField(
                  //       style: const TextStyle(fontWeight: FontWeight.w500),
                  //       decoration: InputDecoration(
                  //           suffixIcon: Icon(
                  //             Icons.visibility_off_outlined,
                  //             color: Colors.grey,
                  //             size: 16.sp,
                  //           ),
                  //           border: InputBorder.none,
                  //           hintText: 'Password'),
                  //       focusNode: focusNodePassword,
                  //     ),
                  //   ),
                  // ),
                  const Expanded(
                      child: SizedBox(
                    height: 10,
                  )),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 700),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/HomePage');
                            },
                            child: FadeInUp(
                                delay: const Duration(milliseconds: 700),
                                duration: const Duration(milliseconds: 800),
                                child: Text('Sign Up')),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Satoshi'),
                                backgroundColor: Color.fromRGBO(0, 170, 19, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16)),
                          ),
                        )
                      ],
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 900),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/LoginPage');
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 170, 19, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
