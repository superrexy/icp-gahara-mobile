import 'dart:convert';

LocationRequest locationRequestFromJson(String str) =>
    LocationRequest.fromJson(json.decode(str));

String locationRequestToJson(LocationRequest data) =>
    json.encode(data.toJson());

class LocationRequest {
  LocationRequest({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  String address;
  String latitude;
  String longitude;

  factory LocationRequest.fromJson(Map<String, dynamic> json) =>
      LocationRequest(
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      };
}
