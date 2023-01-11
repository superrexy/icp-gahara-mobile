import 'dart:convert';

UsersResponse usersResponseFromJson(String str) =>
    UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
  UsersResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  UsersDataResponse data;

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        status: json["status"],
        message: json["message"],
        data: UsersDataResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class UsersDataResponse {
  UsersDataResponse({
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
  DateTime createdAt;
  DateTime updatedAt;

  factory UsersDataResponse.fromJson(Map<String, dynamic> json) =>
      UsersDataResponse(
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
