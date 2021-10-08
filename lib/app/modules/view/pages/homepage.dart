
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/core/data.dart';
import 'package:pazar_iraq/app/modules/view/widgets/categorywidget.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productwidget.dart';

final List<String> imgList = [
  'https://th.bing.com/th/id/OIP.sWWvmctp2ytQiQmD-dJEtAHaE8?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/OIP.T9I6vc72mS5CUK9Q8G2n5gHaFt?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/R.ea0247456a2287fdda81bd894bcc5945?rik=gAUn4ENomFzwEw&pid=ImgRaw&r=0'

];
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,


              title: const Center(
                child: Text(
                   'Home',
                  style: TextStyle(color:Colors.deepOrangeAccent ),
                ),
              ),
            ),
            body:
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: deviceHeight / 3 + 50,
                  child:
                  CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                            ),
                            items: imageSliders,
                          ),
                ),
                 ProductWidget(),
                CategoryWidget(title: "vehicles",categories: AppData.categories),
                CategoryWidget(title: "service",categories: AppData.categories2),
              ],
            ),
            bottomNavigationBar: ConvexAppBar(
              color: Colors.white,
              gradient: linearGradientColor,
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.map, title: 'Discovery'),
                TabItem(icon: Icons.add, title: 'Add'),
                TabItem(icon: Icons.message, title: 'Message'),
                TabItem(icon: Icons.people, title: 'Profile'),
              ],
              initialActiveIndex: 2,//optional, default as 0
              onTap: (int i) => print('click index=$i'),
            )
        );



  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
        margin: const EdgeInsets.all(10.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ))
      .toList();}