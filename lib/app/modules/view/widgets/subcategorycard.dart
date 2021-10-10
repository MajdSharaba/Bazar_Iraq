
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/light_color.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';


class SubCategoryCard extends StatelessWidget {
     Category? subCategory;
   SubCategoryCard({Key? key,this.subCategory}) : super(key: key);

    @override

    Widget build(BuildContext context) {
      return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: LightColor.background,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: const Color(0xff37475A).withOpacity(0.2), blurRadius: 15, spreadRadius: 10),
                  ],
                ),
                // margin: EdgeInsets.symmetric(vertical: product!.isSelected! ? 20 : 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[

                               // Image.network(subCategory!.!,scale: 1)
                              ],
                            ),
                          ),
                          // SizedBox(height: 5),
                          TitleText(
                           // text: subCategory!.name!,
                            fontSize: 20,
                          )],
                      ),
                    ],
                  ),
                )
              // ).ripple(() {
            ),
          ),
          onTap:() {
          });}
    }



