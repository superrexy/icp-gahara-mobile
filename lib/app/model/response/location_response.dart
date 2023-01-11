import 'dart:convert';

LocationResponse locationResponseFromJson(String str) =>
    LocationResponse.fromJson(json.decode(str));

String locationResponseToJson(LocationResponse data) =>
    json.encode(data.toJson());

class LocationResponse {
  LocationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  LocationDataResponse data;

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      LocationResponse(
        status: json["status"],
        message: json["message"],
        data: LocationDataResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class LocationDataResponse {
  LocationDataResponse({
    required this.id,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String address;
  double latitude;
  double longitude;
  DateTime createdAt;
  DateTime updatedAt;

  factory LocationDataResponse.fromJson(Map<String, dynamic> json) =>
      LocationDataResponse(
        id: json["id"],
        address: json["address"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
