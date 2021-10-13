import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/modules/controller/chatrooms_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/beziercontainer.dart';
import 'package:pazar_iraq/app/modules/view/widgets/conversationlist.dart';

class ChatPage extends StatelessWidget {

  final ChatRoomsController chatController =   Get.put(ChatRoomsController());


  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        height: deviceHeight,
        child: Stack(
        children: <Widget>[
        Positioned(
        top: -deviceHeight * .35,
        right: -deviceWidth * .4,
        child: const BezierContainer()),
    Container(
    width: deviceWidth,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Conversations", style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),),
                    // Container(
                    //   padding: EdgeInsets.only(
                    //       left: 8, right: 8, top: 2, bottom: 2),
                    //   height: 30,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     color: Colors.pink[50],
                    //   ),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Icon(Icons.add, color: Colors.pink, size: 20,),
                    //       SizedBox(width: 2,),
                    //       Text("Add New", style: TextStyle(
                    //           fontSize: 14, fontWeight: FontWeight.bold),),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: "Search...",
            //       hintStyle: TextStyle(color: Colors.grey.shade600),
            //       prefixIcon: Icon(
            //         Icons.search, color: Colors.grey.shade600, size: 20,),
            //       filled: true,
            //       fillColor: Colors.grey.shade100,
            //       contentPadding: EdgeInsets.all(8),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20),
            //           borderSide: BorderSide(
            //               color: Colors.grey.shade100
            //           )
            //       ),
            //     ),
            //   ),
            // ),
            // shade100
            Obx(() {

              if (chatController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                itemCount: chatController.chatRoomsData!.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    chatRoomData:chatController.chatRoomsData![index]
                  );
                },
              );
              }
            }),
            //
            //   Obx(() {
            //     if (chatController.isLoading.value)
            //
            //       return Center(child: CircularProgressIndicator());
            //       else
            //     return Text(chatController.chatRooms!.length.toString());}
            //     )
          ]


        ),
      ),
    )])));
  }


}