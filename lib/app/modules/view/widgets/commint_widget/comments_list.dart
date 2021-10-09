import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:pazar_iraq/app/model/comment_model.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';
import 'package:pazar_iraq/app/model/user_model.dart';
import 'package:pazar_iraq/app/modules/controller/productdetail_controller.dart';



class CommentsListKeyPrefix {
  static final String singleComment = "Comment";
  static final String commentUser = "Comment User";
  static final String commentText = "Comment Text";
  static final String commentDivider = "Comment Divider";
}
 final List<UserModel> users = [
  UserModel(
    id: "1",
    name: "Ishfar",
    email: "ishfar@gmail.com",
    image: "assets/images/user.jpg",
    followers: 123,
    joined: DateTime(2019, 4, 30),
    posts: 12,
  ),
  UserModel(
    id: "2",
    name: "Ishrak",
    email: "ishrak@gmail.com",
    image: "assets/images/user.jpg",
    followers: 456,
    joined: DateTime(2018, 5, 30),
    posts: 13,
  ),
  UserModel(
    id: "3",
    name: "Shakleen",
    email: "shakleen@gmail.com",
    image: "assets/images/user.jpg",
    followers: 789,
    joined: DateTime(2017, 6, 30),
    posts: 14,
  ),
];

List<CommentModel> comments = <CommentModel>[
  CommentModel(
    comment:
    "Et hic et sequi inventore. Molestiae laboriosam commodi exercitationem eum. ",
    user: users[0],
    time: DateTime(2019, 4, 30),
  ),
  CommentModel(
    comment: "Unde id provident ut sunt in consequuntur qui sed. ",
    user: users[1],
    time: DateTime(2018, 5, 30),
  ),
  CommentModel(
    comment: "Eveniet nesciunt distinctio sint ut. ",
    user: users[0],
    time: DateTime(2017, 6, 30),
  ),
  CommentModel(
    comment: "Et facere a eos accusantium culpa quaerat in fugiat suscipit. ",
    user: users[2],
    time: DateTime(2019, 4, 30),
  ),
  CommentModel(
    comment: "Necessitatibus pariatur harum deserunt cum illum ut.",
    user: users[1],
    time: DateTime(2018, 5, 30),
  ),
  CommentModel(
    comment:
    "Accusantium neque quis provident voluptatem labore quod dignissimos eum quaerat. ",
    user: users[2],
    time: DateTime(2017, 6, 30),
  ),
  CommentModel(
    comment:
    "Accusantium neque quis provident voluptatem labore quod dignissimos eum quaerat. ",
    user: users[1],
    time: DateTime(2019, 4, 30),
  ),
  CommentModel(
    comment: "Neque est ut rerum vel sunt harum voluptatibus et. ",
    user: users[0],
    time: DateTime(2018, 5, 30),
  ),
  CommentModel(
    comment:
    "Hic accusantium minus fuga exercitationem id aut expedita doloribus. ",
    user: users[1],
    time: DateTime(2017, 6, 30),
  ),
];
class CommentsList extends StatelessWidget {
   CommentsList({Key? key}) : super(key: key);
  final ProductDetailController productDetailController = Get.find();


  @override
  Widget build(BuildContext context) {
    // final List<CommentModel> comments =
    //     InheritedPostModel.of(context).postData!.comments!;


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
        trailing: Text(productDetailController.productDetailData!.comments!.length.toString()),
        title: Text("Comments"),
        children: List<Widget>.generate(
          productDetailController.productDetailData!.comments!.length,
          (int index) => _SingleComment(
            key: ValueKey("${CommentsListKeyPrefix.singleComment} $index"),
            comment: productDetailController.productDetailData!.comments![index],
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
          // UserDetailsWithFollow(
          //   key: ValueKey("${CommentsListKeyPrefix.commentUser} $index"),
          //   userData: commentData.user,
          // ),
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
            rating: 2.75,
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
          Divider(
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
