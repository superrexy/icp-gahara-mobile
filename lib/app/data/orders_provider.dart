import 'package:dio/dio.dart';
import 'package:icp_gahara_mobile/app/data/api_client.dart';
import 'package:icp_gahara_mobile/app/model/request/order_request.dart';
import 'package:icp_gahara_mobile/app/model/response/order_payment_response.dart';
import 'package:icp_gahara_mobile/app/model/response/order_response.dart';

class OrdersProvider {
  final Dio _client = ApiClient.init();

  Future<List<OrdersDataResponse>?> getOrders() async {
    try {
      final Response response = await _client.get("/orders");

      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((e) => OrdersDataResponse.fromJson(e))
            .toList();
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<OrdersDataResponse?> getOrderByID(int orderId) async {
    try {
      final Response response = await _client.get("/orders/$orderId");

      if (response.statusCode == 200) {
        return OrdersDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> doneOrderByID(int orderId) async {
    try {
      final Response response = await _client.get("/orders/$orderId/done");

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<OrdersDataResponse?> createOrder(OrdersRequest request) async {
    try {
      final Response response =
          await _client.post("/orders/create", data: request.toJson());

      if (response.statusCode == 201) {
        return OrdersDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> updateOrder(int orderId, OrdersRequest request) async {
    try {
      final Response response =
          await _client.post("/orders/$orderId/update", data: request.toJson());

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> deleteOrder(int orderId) async {
    try {
      final Response response = await _client.delete("/orders/$orderId/delete");

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<OrderPaymentDataResponse?> orderPayment(int orderId) async {
    try {
      final Response response = await _client.get("/orders/$orderId/payment");

      if (response.statusCode == 200) {
        return OrderPaymentDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
