// To parse this JSON data, do
//
//     final orderPaymentResponse = orderPaymentResponseFromJson(jsonString);

import 'dart:convert';

OrderPaymentResponse orderPaymentResponseFromJson(String str) =>
    OrderPaymentResponse.fromJson(json.decode(str));

String orderPaymentResponseToJson(OrderPaymentResponse data) =>
    json.encode(data.toJson());

class OrderPaymentResponse {
  OrderPaymentResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  OrderPaymentDataResponse? data;

  factory OrderPaymentResponse.fromJson(Map<String, dynamic> json) =>
      OrderPaymentResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : OrderPaymentDataResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class OrderPaymentDataResponse {
  OrderPaymentDataResponse({
    this.id,
    this.orderId,
    this.bank,
    this.vaNumber,
    this.actionUrl,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? orderId;
  String? bank;
  String? vaNumber;
  String? actionUrl;
  DateTime? expiredAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderPaymentDataResponse.fromJson(Map<String, dynamic> json) =>
      OrderPaymentDataResponse(
        id: json["id"],
        orderId: json["order_id"],
        bank: json["bank"],
        vaNumber: json["va_number"],
        actionUrl: json["action_url"],
        expiredAt: json["expired_at"] == null
            ? null
            : DateTime.parse(json["expired_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "bank": bank,
        "va_number": vaNumber,
        "action_url": actionUrl,
        "expired_at": expiredAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
