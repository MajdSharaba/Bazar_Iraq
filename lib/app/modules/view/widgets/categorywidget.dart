import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';

import 'categorycard.dart';


class CategoryWidget extends StatelessWidget {
  final String? title;
   final List<Category>? categories;

  const CategoryWidget({Key? key,this.title,this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                title!,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Spacer(),
              const Text("VIEW ALL")
            ],
          ),
        ),
        Container(
          height: deviceHeight * .25 < 300 ? deviceHeight * .25 : 300,
          //height: height! * .25 < 300 ? height! * .25 : 300,
          // child:
          // ConstrainedBox(
          //   constraints: BoxConstraints(maxHeight: 170, minHeight: height! * .13),
          child: ListView.builder(
              itemBuilder: (context, index) => CategoryCard( category: categories![index]),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: categories!.length,
              scrollDirection: Axis.horizontal),
        )],
    );
  }
}
