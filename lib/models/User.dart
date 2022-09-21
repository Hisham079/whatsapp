import 'dart:convert';

User welcomeFromJson(String str) => User.fromJson(json.decode(str));

String welcomeToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.avatar,
        this.name,
        this.isGroup,
        this.updatedAt,
        this.message,
    });

    String? avatar;
    String? name;
    bool? isGroup;
    String? updatedAt;
    String? message;

    factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json["Avatar"],
        name: json["Name"],
        isGroup: json["IsGrouped"],
        updatedAt: json["UpdatedAt"],
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "Avatar": avatar,
        "Name": name,
        "IsGrouped": isGroup,
        "UpdatedAt": updatedAt,
        "Message": message,
    };
}
