

import 'package:http/http.dart' as http;
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/chatroom.dart';

class ChatService{

 static Future<ChatRooms> fetchChatRooms() async {
   var url = Uri.parse(
       'http://184.168.97.161/public/api/chats/getChats/$user_id');
   var response = await http.get(url);

   if (response.statusCode == 200) {
     var jsonString = response.body;
     print  (jsonString);
     return  chatRoomsFromJson(jsonString);
   } else {
     //show error message
     return null!;
   }

    }

}