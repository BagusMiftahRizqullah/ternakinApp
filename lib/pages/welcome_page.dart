import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:berternak/pages/Home_page.dart';
import 'package:berternak/pages/Login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  navigateToHome() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => const LoginPage()));
  }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: welcome_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => WelcomeConten(
                  image: welcome_data[index].image,
                  title: welcome_data[index].title,
                  description: welcome_data[index].description,
                ),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                    welcome_data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: DotIndicator(
                            isActive: index == _pageIndex,
                          ),
                        )),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                      if (_pageIndex == welcome_data.length - 1) {
                        navigateToHome();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Color.fromRGBO(0, 170, 19, 1)),
                    child: Icon(Icons.arrow_forward,
                        color: Color.fromRGBO(238, 240, 238, 1), size: 30),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 88,
            // ),
          ],
        ),
      )),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isActive ? 12 : 4,
        width: 4,
        decoration: BoxDecoration(
            color: isActive
                ? Color.fromRGBO(0, 170, 19, 1)
                : Colors.grey.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(10))));
  }
}

class Welcome {
  final String image, title, description;

  Welcome(
      {required this.image, required this.title, required this.description});
}

final List<Welcome> welcome_data = [
  Welcome(
    image: "images/berternak_logo.png",
    title: "Mari membeli ternak sekarang dan percayakan pada kami",
    description:
        "Disini kamu akan menemukan pelayanan yang ramah dan amanah sesuai dengan kebutuhanmu.",
  ),
  Welcome(
    image: "images/Flutter.png",
    title: "Jual ternak kamu pada marketplace kami",
    description:
        "Disini kamu akan menemukan pelayanan yang ramah dan amanah sesuai dengan syariiat islam.",
  ),
  Welcome(
    image: "images/Python.png",
    title: "Dapatkan update ternakmu secara realtime",
    description: "Disini kamu akan mendapatkan daily report dari ternakmu.",
  ),
];

class WelcomeConten extends StatelessWidget {
  const WelcomeConten({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 210,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
