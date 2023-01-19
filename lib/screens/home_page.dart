import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viva_practical/global/globals.dart';
import 'package:viva_practical/screens/home.dart';
import 'package:viva_practical/screens/likes_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int bottomIndex = 0;

  late TabController tabController;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this); // initialise it here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              bottomIndex = val;
              pageController.animateToPage(
                val,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            });
          },
          currentIndex: bottomIndex,
          selectedItemColor: Global.button,
          backgroundColor: Global.icon,
          elevation: 0,
          unselectedIconTheme: IconThemeData(
            color: Colors.brown.shade900,
          ),
          unselectedLabelStyle: TextStyle(
              color: Global.button, fontSize: 14, fontWeight: FontWeight.w400),
          selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: "Likes",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag),
              label: "Cataloger",
            ),
          ],
        ),
      body: PageView(
      controller: pageController,
      children: const [
        Home(),
        Likes(),
      ],
    ),
    );
  }
}
