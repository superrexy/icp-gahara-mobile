import 'dart:convert';

OrdersRequest ordersRequestFromJson(String str) =>
    OrdersRequest.fromJson(json.decode(str));

String ordersRequestToJson(OrdersRequest data) => json.encode(data.toJson());

enum TypeRent { day, hour }

class OrdersRequest {
  OrdersRequest({
    required this.nameRent,
    required this.noKtp,
    this.address,
    required this.phone,
    required this.rentalPurposes,
    this.startDate,
    this.endDate,
    required this.carId,
    required this.rentType,
    this.rentHourId,
    required this.paymentType,
  });

  String nameRent;
  String noKtp;
  String? address;
  String phone;
  String rentalPurposes;
  String? startDate;
  String? endDate;
  int carId;
  TypeRent rentType;
  int? rentHourId;
  String paymentType;

  factory OrdersRequest.fromJson(Map<String, dynamic> json) => OrdersRequest(
        nameRent: json["name_rent"],
        noKtp: json["no_ktp"],
        address: json["address"],
        phone: json["phone"],
        rentalPurposes: json["rental_purposes"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        carId: json["car_id"],
        rentType: json["rent_type"],
        rentHourId: json["rent_hour_id"],
        paymentType: json["payment_type"],
      );

  Map<String, dynamic> toJson() => {
        "name_rent": nameRent,
        "no_ktp": noKtp,
        "address": address,
        "phone": phone,
        "rental_purposes": rentalPurposes,
        "start_date": startDate,
        "end_date": endDate,
        "car_id": carId,
        "rent_type": rentType == TypeRent.day ? "day" : "hour",
        "rent_hour_id": rentHourId,
        "payment_type": paymentType,
      };
}
