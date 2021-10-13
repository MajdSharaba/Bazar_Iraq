import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/modules/controller/categories_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/categorywidget.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productwidget.dart';
final List<String> imgList = [
  'https://th.bing.com/th/id/OIP.sWWvmctp2ytQiQmD-dJEtAHaE8?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/OIP.T9I6vc72mS5CUK9Q8G2n5gHaFt?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/R.ea0247456a2287fdda81bd894bcc5945?rik=gAUn4ENomFzwEw&pid=ImgRaw&r=0'

];
class HomeScreen extends StatelessWidget {

  CategoryController categoryController = Get.put(CategoryController());


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
                // child: Text(
                //   'No. ${imgList.indexOf(item)} image',
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 20.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            ),
          ],
        )),
  ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return ListView(
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

        Obx(() {
    if (categoryController.isLoading.value)
    return Center(child: CircularProgressIndicator());
   return  ListView.builder(
        shrinkWrap: true,
        itemCount:categoryController.categoryelement!=null?categoryController.categoryelement!.length:1,
        physics: const BouncingScrollPhysics(),

        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 1,
        //   mainAxisSpacing: 10.0,
        //   crossAxisSpacing: 10.0,
        //   childAspectRatio: 0.8,
        // ),
    itemBuilder: (context, index) =>  CategoryWidget(categoryElement: categoryController.categoryelement!=null?categoryController.categoryelement![index]:null),
    //categoryElement: categoryController.categoryelement![index].children!.first),
    );
    },
       // CategoryWidget(title: "vehicles"),
       // CategoryWidget(title: "service",categories: AppData.categories2),
        )],
    );
  }


}
