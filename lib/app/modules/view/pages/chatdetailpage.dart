import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pazar_iraq/app/modules/controller/chatmeesage_controller.dart';

  class ChatDetailPage extends StatefulWidget{
  String? reciverName;
  String? reciverId;

   ChatDetailPage({Key? key, this.reciverName,this.reciverId}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final String sender_id="2";
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
                    icon: const Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  const SizedBox(width: 2,),
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                  //   maxRadius: 20,
                  // ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Text(widget.reciverName!,style: const TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 6,),
                       // Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                  // Icon(Icons.settings,color: Colors.black54,),
                ],
              ),
            ),
          ),
        ),
        body:

        Container(
          decoration:  new BoxDecoration (color: Color(0xffE1E2E4) ),
          child: Stack(

            children: <Widget>[
    Obx(() {

    if (chatMessageController.isLoad.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
          reverse: true,
          itemCount: chatMessageController.chatMessageData.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10,bottom: 100),
                itemBuilder: (context, index){
                  return Container(
                   padding: const EdgeInsets.only(left: 5,right: 14,top: 10,bottom: 10),
                   child: Align(
                     alignment: (chatMessageController.chatMessageData[index].senderUserId == "2"?Alignment.topLeft:Alignment.topRight),
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: (chatMessageController.chatMessageData[index].senderUserId == sender_id?const Color(0xFF7200CA):Colors.grey.shade200),
                       ),
                       padding: const EdgeInsets.all(16),
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.min,
                           crossAxisAlignment: CrossAxisAlignment.center,


                           verticalDirection: VerticalDirection.down,
                           textBaseline: TextBaseline.ideographic,
                         children: <Widget>[

                           Visibility(
                             visible:chatMessageController.chatMessageData[index].seen=="1"&&chatMessageController.chatMessageData[index].senderUserId == sender_id?true:false,
                              child:Padding(
                               padding: const EdgeInsets.fromLTRB(0,0,10,0),
                               child: Icon(Icons.visibility,size: 10,),
                             ),
                           ),
                         Flexible(
                           child: Text(chatMessageController.chatMessageData[index].messageText!, style: const TextStyle(fontSize: 15,),))]),
                     ),

                   ),
                    );
                },
              );
    }}),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
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
                      const SizedBox(width: 15,),
                      Expanded(
                        child: TextFormField(
                          controller: chatMessageController.messageController,

                          decoration: const InputDecoration(
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
                      const SizedBox(width: 15,),
                      FloatingActionButton(
                        onPressed: (){

                          chatMessageController.addMessage(reciver:widget.reciverId,sender:sender_id);
                          chatMessageController.messageController.clear();

                          },
                        child: const Icon(Icons.send,color: Colors.white,size: 18,),
                         backgroundColor: const Color(0xFF7200CA),

                        elevation: 0,
                      ),
                    ],

                  ),
                ),
              ),
            ],
          ),
        ),
    );}}