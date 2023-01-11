import 'dart:convert';

OrdersRequest ordersRequestFromJson(String str) =>
    OrdersRequest.fromJson(json.decode(str));

String ordersRequestToJson(OrdersRequest data) => json.encode(data.toJson());

class OrdersRequest {
  OrdersRequest({
    required this.nameRent,
    required this.noKtp,
    this.address,
    required this.phone,
    required this.rentalPurposes,
    required this.startDate,
    required this.endDate,
    required this.carId,
  });

  String nameRent;
  String noKtp;
  String? address;
  String phone;
  String rentalPurposes;
  String startDate;
  String endDate;
  int carId;

  factory OrdersRequest.fromJson(Map<String, dynamic> json) => OrdersRequest(
        nameRent: json["name_rent"],
        noKtp: json["no_ktp"],
        address: json["address"],
        phone: json["phone"],
        rentalPurposes: json["rental_purposes"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        carId: json["car_id"],
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
      };
}
