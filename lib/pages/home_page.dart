import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List menuNames = [
    "Titipin Ternak",
    "Daging Sapi",
    "Daging Kambing",
    "Daging Ayam",
    "Cicil Sapi",
    "Cicil Kambing"
  ];

  List<Color> animalColors = [
    Color(0xFFFFCF2F),
    Color.fromARGB(255, 12, 209, 41),
    Color.fromARGB(255, 8, 235, 223),
    Color.fromARGB(255, 232, 113, 210),
    Color.fromARGB(255, 61, 149, 231),
    Color.fromARGB(255, 238, 80, 85),
  ];

  List<Icon> animalIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assessment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];

  List imglist = [
    "ternakin_logo",
    "books",
    "C#",
    "Flutter",
    "Python",
    "React Vative",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
                color: Color.fromRGBO(67, 147, 108, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 38,
                      color: Colors.white,
                    ),
                    Icon(Icons.notifications, size: 38, color: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text("Hi, Wisnu",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here.....",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: menuNames.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 1.1),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: animalColors[index],
                                shape: BoxShape.circle),
                            child: Center(
                              child: animalIcons[index],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            menuNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Titip Ternak",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(67, 147, 108, 1),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    itemCount: imglist.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.height - 50 - 25) /
                              (4 * 240),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
                                SizedBox(height: 10),
                                Text(
                                  imglist[index],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "55 Video",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        selectedItemColor: Color.fromRGBO(67, 147, 108, 1),
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: "Course"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
