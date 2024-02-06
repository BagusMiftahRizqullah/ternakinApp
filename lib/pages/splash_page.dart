import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ternakin/pages/Home_page.dart';
import 'package:ternakin/pages/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // navigate to home
    // navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => const HomePage()));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splashIconSize: 200,
      splash: Container(
          child: Column(
        children: [
          Image.asset(
            "images/ternakin_logo.png",
            height: 100,
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            "rajakandang.com",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                wordSpacing: 2),
          ),
        ],
      )),
      nextScreen: WelcomePage(),
      splashTransition: SplashTransition.sizeTransition,
      duration: 1500,
    );
  }
}
