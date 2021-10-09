
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pazar_iraq/app/model/chatroom.dart';

class ChatService{

 static Future<ChatRooms> fetchChatRooms() async {
    final response = await rootBundle.loadString('assets/chatroom.json');

   return chatRoomsFromJson(response);
  }

}