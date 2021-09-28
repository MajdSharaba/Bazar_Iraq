
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/core/data.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productcard.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                // SizedBox(
                //   width: width! * 0.05,
                // ),
                Text(
                  "Latest products",
                  style: TextStyle(color:Colors.black, fontSize: 14),
                ),
                Spacer(),
                Text("VIEW ALL",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: deviceWidth,
              height: deviceHeight * .7,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 4 / 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20),
                padding: const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
    children: AppData.productList!
        .map(
    (product) => ProductCard(
    product: product,
    onSelected: (model) {


    },
    ),
    )
                    .toList(),
              ),
            ),
          )]);
  }
}