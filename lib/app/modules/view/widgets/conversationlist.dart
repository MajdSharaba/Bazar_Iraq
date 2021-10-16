import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/model/chatroom.dart';
import 'package:pazar_iraq/app/modules/controller/chatmeesage_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/chatdetailpage.dart';

class ConversationList extends StatefulWidget{
  ChatRoomsData? chatRoomData;
  ConversationList({  this.chatRoomData});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  final ChatMessageController chatMessageController = Get.put(ChatMessageController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        chatMessageController.chat_id.value="";
        chatMessageController.getfetchChatMessage(sender_id:2,reciver_id:int.parse(widget.chatRoomData!.recieverUserId!));
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailPage(reciverName:widget.chatRoomData!.recieverUserName!,reciverId:widget.chatRoomData!.recieverUserId ,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?pid=ImgDet&rs=1"),
                    maxRadius: 30,
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.chatRoomData!.recieverUserName!, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.chatRoomData!.lastMessage!,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Text(widget.chatId!,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead!?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}