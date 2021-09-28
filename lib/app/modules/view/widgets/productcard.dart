import 'package:flutter/material.dart';

import 'package:pazar_iraq/app/core/light_color.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  final ValueChanged<Product>? onSelected;
  const ProductCard({Key? key, this.product, this.onSelected}) : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      // margin: EdgeInsets.symmetric(vertical: product!.isSelected! ? 20 : 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  product!.isliked! ? Icons.favorite : Icons.favorite_border,
                  color:
                      product!.isliked! ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               /// SizedBox(height: product!.isSelected! ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xfffbb448),
                      ),
                      Image.asset(product!.image!)
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: product!.name!,
                  fontSize: 10,
                ),
                TitleText(
                  text: product!.category,
                  fontSize:  10,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: product!.price.toString(),
                  fontSize:12,
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
