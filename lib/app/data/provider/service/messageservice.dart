import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pazar_iraq/app/model/chatmessage.dart';

class MessageService{

  static Future<ChatMessages> fetchChatMessage() async {
    final response = await rootBundle.loadString('assets/chatmessage.json');

    return chatMessagesFromJson(response);
  }

}