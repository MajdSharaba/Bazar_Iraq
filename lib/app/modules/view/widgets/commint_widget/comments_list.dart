import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:pazar_iraq/app/model/productdetail.dart';
import 'package:pazar_iraq/app/modules/controller/productdetail_controller.dart';



class CommentsListKeyPrefix {
  static final String singleComment = "Comment";
  static final String commentUser = "Comment User";
  static final String commentText = "Comment Text";
  static final String commentDivider = "Comment Divider";
}

class CommentsList extends StatelessWidget {
   CommentsList({Key? key}) : super(key: key);
  final ProductDetailController productDetailController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:
      Obx(() {
        if (productDetailController.isLoading.value) {
          return Center(child: const CircularProgressIndicator());
        } else {
          return
      ExpansionTile(
        leading: Icon(Icons.comment),
        trailing: Text(productDetailController.productDetailData!.value!.comments!.length.toString()),
        title: Text("Comments"),
        children: List<Widget>.generate(
          productDetailController.productDetailData!.value!.comments!.length,
          (int index) => _SingleComment(
            key: ValueKey("${CommentsListKeyPrefix.singleComment} $index"),
            comment: productDetailController.productDetailData!.value!.comments![index],
          ),
        ),
      );  }}),
    );
  }
}

class _SingleComment extends StatelessWidget {
  final Comment? comment;


   _SingleComment({Key? key, @required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CommentModel commentData =
    //     comments[index!];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

      Row(
          children: <Widget>[
          const CircleAvatar(
            backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1"),
      maxRadius: 15,
    ),
    const SizedBox(width: 16,),
    Expanded(
    child: Container(
    color: Colors.transparent,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    const Text("name", style: TextStyle(fontSize: 16),),
    const SizedBox(height: 6,),
      RatingBarIndicator(
            rating: double.parse(comment!.rating!),
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 10.0,
            direction: Axis.horizontal,
          ),

     Text(comment!.comment!,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: FontWeight.normal),),
    ],
    ),
    ),
    ),
    ],
    ),
          // const CircleAvatar(
          //   backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1"),
          //   maxRadius: 15,
          //
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     commentData.comment!,
          //     key: ValueKey("${CommentsListKeyPrefix.commentText} $index"),
          //     textAlign: TextAlign.left,
          //   ),
          // ),
          const Divider(
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
