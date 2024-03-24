import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:berternak/pages/Home_page.dart';
import 'package:berternak/pages/welcome_page.dart';
import 'package:berternak/pages/account_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // navigate to home
    // navigateToHome();
  }

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Icon(
      Icons.chat,
      size: 150,
    ),
    AccountPage(),
  ];

  int _selectedIndex = 0; //New

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex != 0
          ? null
          : AppBar(
              elevation: 0,
              backgroundColor: Color.fromRGBO(0, 170, 19, 1),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.dashboard,
                  size: 38,
                  color: Colors.white,
                ),
              ),
              actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        size: 38,
                        color: Colors.white,
                      ))
                ]),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        selectedIconTheme:
            IconThemeData(color: Color.fromRGBO(67, 147, 108, 1)),
        selectedItemColor: Color.fromRGBO(67, 147, 108, 1),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
