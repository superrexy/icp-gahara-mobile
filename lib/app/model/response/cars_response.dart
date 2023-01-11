import 'dart:convert';

CarsResponse carsResponseFromJson(String str) =>
    CarsResponse.fromJson(json.decode(str));

String carsResponseToJson(CarsResponse data) => json.encode(data.toJson());

class CarsResponse {
  CarsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<CarsDataResponse> data;

  factory CarsResponse.fromJson(Map<String, dynamic> json) => CarsResponse(
        status: json["status"],
        message: json["message"],
        data: List<CarsDataResponse>.from(
            json["data"].map((x) => CarsDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CarsDataResponse {
  CarsDataResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.seats,
    required this.image,
    required this.typeFuel,
    required this.typeCar,
    required this.transmision,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String description;
  int price;
  int seats;
  String image;
  String typeFuel;
  String typeCar;
  String transmision;
  DateTime createdAt;
  DateTime updatedAt;

  factory CarsDataResponse.fromJson(Map<String, dynamic> json) =>
      CarsDataResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        seats: json["seats"],
        image: json["image"],
        typeFuel: json["type_fuel"],
        typeCar: json["type_car"],
        transmision: json["transmision"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "seats": seats,
        "image": image,
        "type_fuel": typeFuel,
        "type_car": typeCar,
        "transmision": transmision,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
