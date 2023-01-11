import 'dart:convert';

LoginRegisterResponse? loginRegisterResponseFromJson(String str) =>
    LoginRegisterResponse.fromJson(json.decode(str));

String loginRegisterResponseToJson(LoginRegisterResponse? data) =>
    json.encode(data!.toJson());

class LoginRegisterResponse {
  LoginRegisterResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool? status;
  String? message;
  LoginRegisterData? data;

  factory LoginRegisterResponse.fromJson(Map<String, dynamic> json) =>
      LoginRegisterResponse(
        status: json["status"],
        message: json["message"],
        data: LoginRegisterData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class LoginRegisterData {
  LoginRegisterData({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory LoginRegisterData.fromJson(Map<String, dynamic> json) =>
      LoginRegisterData(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.noKtp,
    required this.address,
    required this.phone,
    required this.email,
    required this.role,
    required this.userImage,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String fullName;
  String noKtp;
  String? address;
  String? phone;
  String email;
  String role;
  String? userImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        noKtp: json["no_ktp"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"],
        userImage: json["user_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "no_ktp": noKtp,
        "address": address,
        "phone": phone,
        "email": email,
        "role": role,
        "user_image": userImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
