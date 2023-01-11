import 'dart:convert';
import 'dart:io';

CarsRequest carsRequestFromJson(String str) =>
    CarsRequest.fromJson(json.decode(str));

String carsRequestToJson(CarsRequest data) => json.encode(data.toJson());

class CarsRequest {
  CarsRequest({
    required this.name,
    required this.description,
    required this.typeCar,
    required this.price,
    required this.seats,
    required this.typeFuel,
    required this.transmision,
    this.carImage,
  });

  String name;
  String description;
  String typeCar;
  String price;
  String seats;
  String typeFuel;
  String transmision;
  File? carImage;

  factory CarsRequest.fromJson(Map<String, dynamic> json) => CarsRequest(
        name: json["name"],
        description: json["description"],
        typeCar: json["type_car"],
        price: json["price"],
        seats: json["seats"],
        typeFuel: json["type_fuel"],
        transmision: json["transmision"],
        carImage: json["carImage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "type_car": typeCar,
        "price": price,
        "seats": seats,
        "type_fuel": typeFuel,
        "transmision": transmision,
        "carImage": carImage,
      };
}
