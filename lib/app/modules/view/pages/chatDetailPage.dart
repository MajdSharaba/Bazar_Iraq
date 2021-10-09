import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pazar_iraq/app/modules/controller/chatmeesage_controller.dart';

  class ChatDetailPage extends StatefulWidget{
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final userid=1;
  ChatMessageController chatMessageController =  Get.put(ChatMessageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 2,),
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                  //   maxRadius: 20,
                  // ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Ahmad",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                  // Icon(Icons.settings,color: Colors.black54,),
                ],
              ),
            ),
          ),
        ),
        body:Stack(
          children: <Widget>[
    Obx(() {

    if (chatMessageController.isLoad.value)
    return Center(child: CircularProgressIndicator());
    else
    return ListView.builder(
              itemCount: chatMessageController.chatMessageData.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (chatMessageController.chatMessageData[index].recieverUserId == userid?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (chatMessageController.chatMessageData[index].recieverUserId == userid?Color(0xfffbb448):Colors.grey.shade200),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(chatMessageController.chatMessageData[index].messageText!, style: TextStyle(fontSize: 15),),
                    ),
                  ),
                );
              },
            );}),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    // GestureDetector(
                    //   onTap: (){
                    //   },
                    //   child: Container(
                    //     height: 30,
                    //     width: 30,
                    //     decoration: BoxDecoration(
                    //       color: Colors.lightBlue,
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    //   ),
                    // ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: TextFormField(
                        controller: chatMessageController.messageController,

                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none
                        ),
                        onSaved: (text) {

                            chatMessageController.message= text!;
                            //you can access nameController in its scope to get
                            // the value of text entered as shown below
                            //fullName = nameController.text;

                        },
                      ),
                    ),
                    SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: (){

                        chatMessageController.addMessage();},
                      child: Icon(Icons.send,color: Colors.white,size: 18,),
                       backgroundColor: Color(0xfffbb448),

                      elevation: 0,
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
    );}}