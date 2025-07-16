import 'dart:convert';

class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? open_id;
  int? online;

  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.open_id,
    this.online,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "description": description,
    "email": email,
    "phone": phone,
    "avatar": avatar,
    "open_id": open_id,
    "online": online,
  };
}

class UserProfile {
  dynamic type;
  String? name;
  String? description;
  String? access_token;
  String? avatar;
  String? token;
  int? online;

  UserProfile({
    this.type,
    this.name,
    this.description,
    this.access_token,
    this.avatar,
    this.token,
    this.online,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    // if ((json["accesstoken"] != null)) {
    //   return UserProfile();
    // }
    return UserProfile(
      type: json["type"],
      name: json["name"],
      description: json["description"],
      access_token: json["access_token"],
      token: json["token"],
      avatar: json["avatar"],
      online: json["online"],
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "description": description,
    "accesstoken": access_token,
    "token": token,
    "avatar": avatar,
    "online": online,
  };
}

class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserProfile? data;

  UserLoginResponseEntity({this.code, this.msg, this.data});

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserProfile.fromJson(json['data']),
      );
}
