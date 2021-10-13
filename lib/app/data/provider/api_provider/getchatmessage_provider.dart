
import 'package:http/http.dart' as http;
import 'package:pazar_iraq/app/model/chatmessage.dart';

class MessageService{

  static Future<ChatMessages> fetchChatMessage(int? chatId, int? senderId) async {
    var url = Uri.parse(
        'http://184.168.97.161/public/api/chats/getChatMessages/$chatId/2');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print  (jsonString);
      return  chatMessagesFromJson(jsonString);
    } else {
      //show error message
      return null!;
    }

  }
  static void  sendChatMessage({chatid_id, reciver_id, sender_id,message}) async{
    var url = Uri.parse('http://184.168.97.161/public/api/chats/sendMessage');
    var response = await http.post(url, body: {'chat_id': chatid_id, 'sender_user_id': sender_id,'reciever_user_id':reciver_id,'text':message});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


  }

}