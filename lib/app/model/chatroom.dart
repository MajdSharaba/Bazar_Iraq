import 'dart:convert';

ChatRooms chatRoomsFromJson(String str) => ChatRooms.fromJson(json.decode(str));

String chatRoomsToJson(ChatRooms data) => json.encode(data.toJson());

class ChatRooms {
  ChatRooms({
    this.data,
  });

  List<ChatRoomsData>? data;

  factory ChatRooms.fromJson(Map<String, dynamic> json) => ChatRooms(
    data: List<ChatRoomsData>.from(json["data"].map((x) => ChatRoomsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ChatRoomsData {
  ChatRoomsData({
    this.chatId,
    this.recieverUserId,
    this.recieverUserName,
    this.lastMessage,
  });

  String? chatId;
  String? recieverUserId;
  String? recieverUserName;
  String?lastMessage;

  factory ChatRoomsData.fromJson(Map<String, dynamic> json) => ChatRoomsData(
    chatId: json["chat_id"],
    recieverUserId: json["reciever_user_id"],
    recieverUserName: json["reciever_user_name"],
     lastMessage: json["latest_message"]

  );

  Map<String, dynamic> toJson() => {
    "chat_id": chatId,
    "reciever_user_id": recieverUserId,
    "reciever_user_name": recieverUserName,
  };
}
