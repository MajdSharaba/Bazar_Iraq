
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/product.dart';

class FavoriteCard extends StatelessWidget {

  const FavoriteCard(
      {Key? key,this.product})
      : super(key: key);

  final ProductData? product;


  @override
  Widget build(BuildContext context) {
    return
    AspectRatio(
        aspectRatio: 3 / 1,
        child:  Container(
          margin: EdgeInsets.only(right: 20, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 15,
              color: Colors.grey.shade200,
            )],
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:product!.images!.isEmpty? Image.network("https://th.bing.com/th/id/OIP.hV6MoBaE8NYeMCugmhd7_QHaEo?pid=ImgDet&rs=1", fit: BoxFit.cover):Image.network(product!.images!.first.originalUrl!, fit: BoxFit.cover)),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(title:Text(product!.name!,

                        style: TextStyle(color: Colors.black, fontSize: 18,),


                    ),
                          trailing:Text("\$ " +product!.price.toString() + '.00',
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                          ),

                      ),
                      SizedBox(height: 5,),
                      // Text(product!.name?? "Item", style: TextStyle(color: Colors.orange.shade400, fontSize: 13,),),
                      SizedBox(height: 10,),
                      // Text("\$ " +product!.price.toString() + '.00',
                      //   style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                      // ),
                    ]
                ),
              )
            ],
          ),
        )
    );
  }
}
