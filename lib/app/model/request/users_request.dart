import 'dart:convert';

UsersRequest usersRequestFromJson(String str) =>
    UsersRequest.fromJson(json.decode(str));

String usersRequestToJson(UsersRequest data) => json.encode(data.toJson());

class UsersRequest {
  UsersRequest({
    required this.fullName,
    required this.address,
    required this.phone,
  });

  String fullName;
  String? address;
  String phone;

  factory UsersRequest.fromJson(Map<String, dynamic> json) => UsersRequest(
        fullName: json["full_name"],
        address: json["address"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "address": address,
        "phone": phone,
      };
}
