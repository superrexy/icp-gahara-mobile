// To parse this JSON data, do
//
//     final ordersResponse = ordersResponseFromJson(jsonString);

import 'dart:convert';

OrdersResponse ordersResponseFromJson(String str) =>
    OrdersResponse.fromJson(json.decode(str));

String ordersResponseToJson(OrdersResponse data) => json.encode(data.toJson());

class OrdersResponse {
  OrdersResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<OrdersDataResponse>? data;

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<OrdersDataResponse>.from(
                json["data"]!.map((x) => OrdersDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrdersDataResponse {
  OrdersDataResponse({
    this.id,
    this.nameRent,
    this.noKtp,
    this.address,
    this.phone,
    this.rentalPurposes,
    this.startDate,
    this.endDate,
    this.totalPrice,
    this.status,
    this.snapToken,
    this.rentType,
    this.carId,
    this.rentHourId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.midtrans,
    this.rentHour,
    this.car,
  });

  int? id;
  String? nameRent;
  String? noKtp;
  String? address;
  String? phone;
  String? rentalPurposes;
  DateTime? startDate;
  DateTime? endDate;
  int? totalPrice;
  String? status;
  dynamic snapToken;
  String? rentType;
  int? carId;
  int? rentHourId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Midtrans? midtrans;
  RentHour? rentHour;
  Car? car;

  factory OrdersDataResponse.fromJson(Map<String, dynamic> json) =>
      OrdersDataResponse(
        id: json["id"],
        nameRent: json["name_rent"],
        noKtp: json["no_ktp"],
        address: json["address"],
        phone: json["phone"],
        rentalPurposes: json["rental_purposes"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        totalPrice: json["total_price"],
        status: json["status"],
        snapToken: json["snap_token"],
        rentType: json["rent_type"],
        carId: json["car_id"],
        rentHourId: json["rent_hour_id"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        midtrans: json["midtrans"] == null
            ? null
            : Midtrans.fromJson(json["midtrans"]),
        rentHour: json["rent_hour"] == null
            ? null
            : RentHour.fromJson(json["rent_hour"]),
        car: json["car"] == null ? null : Car.fromJson(json["car"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_rent": nameRent,
        "no_ktp": noKtp,
        "address": address,
        "phone": phone,
        "rental_purposes": rentalPurposes,
        "start_date": startDate,
        "end_date": endDate,
        "total_price": totalPrice,
        "status": status,
        "snap_token": snapToken,
        "rent_type": rentType,
        "car_id": carId,
        "rent_hour_id": rentHourId,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "midtrans": midtrans?.toJson(),
        "rent_hour": rentHour?.toJson(),
        "car": car?.toJson(),
      };
}

class Car {
  Car({
    required this.id,
    required this.name,
    required this.description,
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
  int seats;
  String image;
  String typeFuel;
  String typeCar;
  String transmision;
  DateTime createdAt;
  DateTime updatedAt;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        name: json["name"],
        description: json["description"],
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
        "seats": seats,
        "image": image,
        "type_fuel": typeFuel,
        "type_car": typeCar,
        "transmision": transmision,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Midtrans {
  Midtrans({
    this.bank,
    this.vaNumber,
    this.actionUrl,
  });

  String? bank;
  String? vaNumber;
  dynamic actionUrl;

  factory Midtrans.fromJson(Map<String, dynamic> json) => Midtrans(
        bank: json["bank"],
        vaNumber: json["va_number"],
        actionUrl: json["action_url"],
      );

  Map<String, dynamic> toJson() => {
        "bank": bank,
        "va_number": vaNumber,
        "action_url": actionUrl,
      };
}

class RentHour {
  RentHour({
    required this.id,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.carId,
  });

  int id;
  String name;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  int carId;

  factory RentHour.fromJson(Map<String, dynamic> json) => RentHour(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        carId: json["car_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "car_id": carId,
      };
}
