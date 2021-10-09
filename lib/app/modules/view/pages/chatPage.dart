import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:pazar_iraq/app/model/chatUsersModel.dart';
import 'package:pazar_iraq/app/modules/controller/chatrooms_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/conversationList.dart';

class ChatPage extends StatelessWidget {

  final ChatRoomsController chatController =   Get.put(ChatRoomsController());
  //
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "Now"),
    ChatUsers(name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "Yesterday"),
    ChatUsers(name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "31 Mar"),
    ChatUsers(name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "23 Mar"),
    ChatUsers(name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "17 Mar"),
    ChatUsers(name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "24 Feb"),
    ChatUsers(name: "John Wick",
        messageText: "How are you?",
        imageURL: "https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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

              if (chatController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
              return ListView.builder(
                itemCount: chatController.chatRoomsData!.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    name:chatController.chatRoomsData![index].recieverUserName! ,

                   //  Container(
                   // child: Text(chatController.chatRooms![1].recieverUserName!)
                      messageText: chatUsers[index].messageText,
                    imageUrl: chatUsers[index].imageURL,
                     time: chatUsers[index].time,
                     isMessageRead: (index == 0 || index == 3) ? true : false,


                  );
                },
              );
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
    );
  }


}