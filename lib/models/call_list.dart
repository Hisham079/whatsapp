// To parse this JSON data, do
//
//     final callList = callListFromJson(jsonString);

import 'dart:convert';

CallModel callListFromJson(String str) => CallModel.fromJson(json.decode(str));

String callListToJson(CallModel data) => json.encode(data.toJson());

class CallModel {
    CallModel({
       this.avatar,
        this.name,
        this.callType,
        this.icon,
        this.callTime,
    });

    String? avatar;
    String? name;
    String? callType;
    String? icon;
    String? callTime;

    factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        avatar: json["avatar"],
        name: json["name"],
        callType: json["call_type"],
        icon: json["icon"],
        callTime: json["Call_time"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "call_type": callType,
        "icon": icon,
        "Call_time": callTime,
    };
}
