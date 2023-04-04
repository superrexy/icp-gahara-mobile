// To parse this JSON data, do
//
//     final carsResponse = carsResponseFromJson(jsonString);

import 'dart:convert';

CarsResponse carsResponseFromJson(String str) =>
    CarsResponse.fromJson(json.decode(str));

String carsResponseToJson(CarsResponse data) => json.encode(data.toJson());

class CarsResponse {
  CarsResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<CarsDataResponse>? data;

  factory CarsResponse.fromJson(Map<String, dynamic> json) => CarsResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CarsDataResponse>.from(
                json["data"]!.map((x) => CarsDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CarsDataResponse {
  CarsDataResponse({
    this.id,
    this.name,
    this.description,
    this.seats,
    this.image,
    this.typeFuel,
    this.typeCar,
    this.transmision,
    this.createdAt,
    this.updatedAt,
    this.priceDay,
    this.pricesHour,
    this.carDayPrice,
    this.carHourPrice,
    this.carImages,
  });

  int? id;
  String? name;
  String? description;
  int? seats;
  String? image;
  String? typeFuel;
  String? typeCar;
  String? transmision;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? priceDay;
  int? pricesHour;
  CarPrice? carDayPrice;
  List<CarPrice>? carHourPrice;
  List<CarImage>? carImages;

  factory CarsDataResponse.fromJson(Map<String, dynamic> json) =>
      CarsDataResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        seats: json["seats"],
        image: json["image"],
        typeFuel: json["type_fuel"],
        typeCar: json["type_car"],
        transmision: json["transmision"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        priceDay: json["price_day"],
        pricesHour: json["prices_hour"],
        carDayPrice: json["car_day_price"] == null
            ? null
            : CarPrice.fromJson(json["car_day_price"]),
        carHourPrice: json["car_hour_price"] == null
            ? []
            : List<CarPrice>.from(
                json["car_hour_price"]!.map((x) => CarPrice.fromJson(x))),
        carImages: json["car_images"] == null
            ? []
            : List<CarImage>.from(
                json["car_images"]!.map((x) => CarImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "seats": seats,
        "image": image,
        "type_fuel": typeFuel,
        "type_car": typeCar,
        "transmision": transmision,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "price_day": priceDay,
        "prices_hour": pricesHour,
        "car_day_price": carDayPrice?.toJson(),
        "car_hour_price": carHourPrice == null
            ? []
            : List<dynamic>.from(carHourPrice!.map((x) => x.toJson())),
      };
}

class CarPrice {
  CarPrice({
    this.id,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.carId,
    this.name,
  });

  int? id;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? carId;
  String? name;

  factory CarPrice.fromJson(Map<String, dynamic> json) => CarPrice(
        id: json["id"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        carId: json["car_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "car_id": carId,
        "name": name,
      };
}

class CarImage {
  CarImage({
    this.id,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.carId,
  });

  int? id;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? carId;

  factory CarImage.fromJson(Map<String, dynamic> json) => CarImage(
        id: json["id"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        carId: json["car_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "car_id": carId,
      };
}
