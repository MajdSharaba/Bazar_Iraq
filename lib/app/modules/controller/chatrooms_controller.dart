import 'package:get/state_manager.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/getchat_provider.dart';
import 'package:pazar_iraq/app/model/chatroom.dart';

class ChatRoomsController extends GetxController {
   var isLoading = true.obs;
  List<ChatRoomsData>? chatRoomsData;


  @override
  void onInit() {
    getfetchChatroom();
    super.onInit();

  }


  void getfetchChatroom() async {
    try {
       isLoading(true);
      var chatrooms = await ChatService.fetchChatRooms();

      if (chatrooms != null) {

        chatRoomsData = chatrooms.data;

      }

    } finally {
      isLoading(false);
    }
  }
}
