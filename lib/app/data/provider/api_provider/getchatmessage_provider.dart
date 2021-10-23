
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/chatmessage.dart';

class MessageService{

  static Future<ChatMessages> fetchChatMessage(int?senderId , int? reciverId) async {
    var url = Uri.parse(
        'http://184.168.97.161/public/api/chats/getChatMessages/$senderId/$reciverId');
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
  static Future<String>  sendChatMessage({chatid_id, reciver_id, sender_id,message}) async{
    var url = Uri.parse('http://184.168.97.161/public/api/chats/sendMessage');
    var response = await http.post(url, body: {'chat_id': chatid_id, 'sender_user_id': user_id.toString(),'reciever_user_id':reciver_id,'text':message});
    if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var decodedJson=jsonDecode(response.body);
    var data=decodedJson["data"]["chatID"];
    print(data);
    return data;}
    else{
      return "";
    }


  }

}