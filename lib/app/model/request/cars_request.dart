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
    required this.priceDay,
    required this.seats,
    required this.typeFuel,
    required this.transmision,
    this.images,
    this.pricesHour,
  });

  String name;
  String description;
  String typeCar;
  String priceDay;
  String seats;
  String typeFuel;
  String transmision;
  List<File>? images;
  List<PricesHour>? pricesHour;

  factory CarsRequest.fromJson(Map<String, dynamic> json) => CarsRequest(
        name: json["name"],
        description: json["description"],
        typeCar: json["type_car"],
        priceDay: json["price_day"],
        seats: json["seats"],
        typeFuel: json["type_fuel"],
        transmision: json["transmision"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "type_car": typeCar,
        "price_day": priceDay,
        "seats": seats,
        "type_fuel": typeFuel,
        "transmision": transmision,
        "images": images,
        "prices_hour": pricesHour,
      };
}

class PricesHour {
  final int? id;
  final String name;
  final String price;

  PricesHour({
    this.id,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}
