import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:pazar_iraq/app/data/provider/service/messageservice.dart';
import 'package:pazar_iraq/app/model/chatmessage.dart';

class ChatMessageController extends GetxController {
  var isLoad = true.obs;
  RxList chatMessageData=[].obs;
   late TextEditingController messageController = TextEditingController();
   String message = '';



  @override
  void onInit() {


    messageController =TextEditingController();
    super.onInit();

  }
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }


  void getfetchChatMessage(int id) async {
    try {
      print (id);
      isLoad(true);
      var chatMessage = await MessageService.fetchChatMessage();

      if (chatMessage != null) {

        chatMessageData.value = chatMessage.data!;

      }

    } finally {
      isLoad(false);
    }
  }
  void addMessage(){
    print(messageController.text);

    chatMessageData.add(new ChatMessageData(

        id: 3,
        chatId: 1,
        senderUserId: 2,
        recieverUserId: 1,
        messageText: messageController.text,
        seen: 1,
        datetime: DateTime(2021),
    ));
  }
}
