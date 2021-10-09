import 'dart:convert';


ChatMessages chatMessagesFromJson(String str) => ChatMessages.fromJson(json.decode(str));

String chatMessagesToJson(ChatMessages data) => json.encode(data.toJson());

class ChatMessages {
  ChatMessages({
    this.data,
  });

  List<ChatMessageData>? data;

  factory ChatMessages.fromJson(Map<String, dynamic> json) => ChatMessages(
    data: List<ChatMessageData>.from(json["data"].map((x) => ChatMessageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ChatMessageData {
  ChatMessageData({
    this.id,
    this.chatId,
    this.senderUserId,
    this.recieverUserId,
    this.messageText,
    this.seen,
    this.datetime,
  });

  int? id;
  int? chatId;
  int? senderUserId;
  int? recieverUserId;
  String? messageText;
  int? seen;
  DateTime? datetime;

  factory ChatMessageData.fromJson(Map<String, dynamic> json) => ChatMessageData(
    id: json["id"],
    chatId: json["chat_id"],
    senderUserId: json["sender_user_id"],
    recieverUserId: json["reciever_user_id"],
    messageText: json["message_text"],
    seen: json["seen"],
    datetime: DateTime.parse(json["datetime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chat_id": chatId,
    "sender_user_id": senderUserId,
    "reciever_user_id": recieverUserId,
    "message_text": messageText,
    "seen": seen,
    "datetime": datetime!.toIso8601String(),
  };
}
