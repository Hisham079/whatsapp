// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    this.message,
    this.time,
    this.isSent, 
    this.isReaded,
  });

  String? message;
  String? time;
  bool? isSent;
  bool? isReaded;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
        time: json["time"],
        isSent: json["isSent"],
        isReaded:json["isReaded"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "time": time,
        "isSent": isSent,
        "isReaded":isReaded
      };
}
