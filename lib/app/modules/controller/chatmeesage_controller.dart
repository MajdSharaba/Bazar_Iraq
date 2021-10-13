import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/getchatmessage_provider.dart';
import 'package:pazar_iraq/app/model/chatmessage.dart';

class ChatMessageController extends GetxController {
  var isLoad = true.obs;
  RxList chatMessageData=[].obs;
   late TextEditingController messageController = TextEditingController();
   String message = '';
   var chat_id="".obs;



  @override
  void onInit() {


    messageController =TextEditingController();
    super.onInit();

  }
  @override
  void dispose() {
    messageController.dispose();

    chat_id.value="";
    super.dispose();
  }


  void getfetchChatMessage( {int? sender_id, int? reciver_id}) async {
    try {
      print (sender_id);
      isLoad(true);
      var chatMessage = await MessageService.fetchChatMessage(sender_id,reciver_id);

      if (chatMessage != null) {

        chatMessageData.value = chatMessage.data!;

      }

    } finally {
      isLoad(false);
    }
  }
  void addMessage({sender, reciver}){


    print("mahhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"+chat_id.value);
    chatMessageData.add(new ChatMessageData(

        id: 3,
        chatId: "1",
        senderUserId: "2",
        recieverUserId: "1",
        messageText: messageController.text,
        seen: "0",
        datetime: DateTime(2021),
    ));
     MessageService.sendChatMessage(sender_id:sender,reciver_id:reciver,chatid_id:chat_id.value,message:messageController.text
       ).then((value) => chat_id.value=value);
  }
}
