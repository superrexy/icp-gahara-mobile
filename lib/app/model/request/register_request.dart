import 'dart:convert';

RegisterRequest? registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest? data) =>
    json.encode(data!.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.fullName,
    required this.noKtp,
    required this.address,
    required this.email,
    required this.password,
  });

  String fullName;
  String noKtp;
  String address;
  String email;
  String password;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        fullName: json["full_name"],
        noKtp: json["no_ktp"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "no_ktp": noKtp,
        "address": address,
        "email": email,
        "password": password,
      };
}
