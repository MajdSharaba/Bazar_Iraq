
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';

class CategoryCard extends StatelessWidget {
  Category category;

  CategoryCard({Key? key,required this.category}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: deviceHeight * .137 < 160 ? deviceHeight * .137 : 160,
                    width: deviceWidth * .5 < 250 ? deviceWidth * .5 : 250,
                    //   child: Image.asset(image,fit: BoxFit.cover,)
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(category.image!), fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  height: 60,
                  width: deviceWidth * .5 < 250 ? deviceWidth * .5 : 250,
                  left: 5,
                  //right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.black12],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                ),
                Positioned(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        //decoration: BoxDecoration(
                        //   shape: BoxShape.rectangle,
                        //   color: Colors.black.withOpacity(.4),
                        //  borderRadius: BorderRadius.all(Radius.circular(10))
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              category.name!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              category.monthyear!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          category.discount! + "%",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  left: 10,
                  bottom: 10,
                  right: 15,
                )
              ],
            )),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("\$ " + '${(category.newprice)}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            SizedBox(
              width: deviceWidth * 0.08,
            ),
            Text("\$ " + '${(category.oldprice)}',
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic)),
          ],
        )
      ],
    );
  }
}
