import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/modules/controller/categories_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/subcategorypage.dart';

import 'categorycard.dart';


class CategoryWidget extends StatelessWidget {
 // final String? title;
   final CategoryElement? categoryElement;

   CategoryWidget({Key? key,this.categoryElement}) : super(key: key);
  //CategoryController categoryController = Get.put(CategoryController());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SizedBox(
                //   width: width! * 0.05,
                // ),
                Text(
                  categoryElement!.nameEn!,
                  style: const TextStyle(color: Colors.black, fontSize: 16,fontStyle: FontStyle.normal),
                ),
                const Spacer(),
                 TextButton(onPressed: (){
                   Navigator.of(context).push(
                       MaterialPageRoute(
                           builder: (context) => SubCategoryPage(categoryElemen:categoryElement)));
                 }, child: const Text("VIEW ALL",
                   style: TextStyle(color: Colors.black, fontSize: 12,fontStyle: FontStyle.normal),),)
              ],
            ),
          ),
          Container(
            height: deviceHeight * .25 < 300 ? deviceHeight * .2 : 300,
            //height: height! * .25 < 300 ? height! * .25 : 300,
            // child:
            // ConstrainedBox(
            //   constraints: BoxConstraints(maxHeight: 170, minHeight: height! * .13),
            // child: ListView.builder(
            //     itemBuilder: (context, index) => CategoryCard( category: categories![index]),
            //     shrinkWrap: true,
            //     padding: const EdgeInsets.all(0.0),
            //     itemCount: categories!.length,
            //     scrollDirection: Axis.horizontal),
            //child: Text(" ")
           child:  categoryElement!=null?
              ListView.builder(
                shrinkWrap: true,
                 itemCount:categoryElement!.children!.length,
                padding: const EdgeInsets.all(0.0),
                  scrollDirection: (Axis.horizontal),
                   itemBuilder: (context, index) => CategoryCard( categoryElement: categoryElement!.children![index]),
              ):
              Text(" ")



            )

          ],
      ),
    );
  }
}
