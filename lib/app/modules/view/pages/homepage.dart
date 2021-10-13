
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/modules/view/pages/chatpage.dart';
import 'package:pazar_iraq/app/modules/view/pages/create_product_page.dart';
import 'package:pazar_iraq/app/modules/view/pages/home_screen.dart';
import 'package:pazar_iraq/app/modules/view/pages/profile_screen.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  final _pageOptions = [HomeScreen(),  HomeScreen(),CreateProductPage(), ChatPage(),ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[selectedPage],
        bottomNavigationBar: ConvexAppBar(
            color: Colors.white,
            backgroundColor: Colors.grey,
            gradient: linearGradientColor,
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.map, title: 'Discovery'),
              TabItem(icon: Icons.add, title: 'Add'),
              TabItem(icon: Icons.message, title: 'Message'),
              TabItem(icon: Icons.people, title: 'Profile',),
            ],
            initialActiveIndex: 2,
            //optional, default as 0
            onTap: (int i) {
              setState(() {
                selectedPage = i;
              });
            })
    );
  }
  }

