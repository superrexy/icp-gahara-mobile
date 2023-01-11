import 'dart:convert';

OrdersResponse ordersResponseFromJson(String str) =>
    OrdersResponse.fromJson(json.decode(str));

String ordersResponseToJson(OrdersResponse data) => json.encode(data.toJson());

class OrdersResponse {
  OrdersResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<OrdersDataResponse> data;

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
        status: json["status"],
        message: json["message"],
        data: List<OrdersDataResponse>.from(
            json["data"].map((x) => OrdersDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrdersDataResponse {
  OrdersDataResponse({
    required this.id,
    required this.nameRent,
    required this.noKtp,
    required this.address,
    required this.phone,
    required this.rentalPurposes,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.status,
    required this.carId,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.car,
  });

  int id;
  String nameRent;
  String noKtp;
  String address;
  String phone;
  String rentalPurposes;
  DateTime startDate;
  DateTime endDate;
  int totalPrice;
  String status;
  int carId;
  int userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Car car;

  factory OrdersDataResponse.fromJson(Map<String, dynamic> json) =>
      OrdersDataResponse(
        id: json["id"],
        nameRent: json["name_rent"],
        noKtp: json["no_ktp"],
        address: json["address"],
        phone: json["phone"],
        rentalPurposes: json["rental_purposes"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        totalPrice: json["total_price"],
        status: json["status"],
        carId: json["car_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        car: Car.fromJson(json["car"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_rent": nameRent,
        "no_ktp": noKtp,
        "address": address,
        "phone": phone,
        "rental_purposes": rentalPurposes,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "total_price": totalPrice,
        "status": status,
        "car_id": carId,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "car": car.toJson(),
      };
}

class Car {
  Car({
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

  factory Car.fromJson(Map<String, dynamic> json) => Car(
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
