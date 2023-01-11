import 'package:dio/dio.dart';
import 'package:icp_gahara_mobile/app/data/api_client.dart';
import 'package:icp_gahara_mobile/app/model/request/login_request.dart';
import 'package:icp_gahara_mobile/app/model/request/register_request.dart';
import 'package:icp_gahara_mobile/app/model/response/login_register_response.dart';

class AuthenticationProvider {
  final Dio _client = ApiClient.init();

  Future<LoginRegisterResponse?> register(RegisterRequest request) async {
    try {
      final Response response =
          await _client.post('/auth/register', data: request.toJson());

      if (response.statusCode == 201) {
        return LoginRegisterResponse.fromJson(response.data);
      }

      return null;
    } on DioError catch (e) {
      if (e.response?.data['message'] == "EMAIL_ALREADY_EXISTS") {
        throw "Email sudah terdaftar";
      } else if (e.response?.data['message'] == null) {
        throw "Terjadi kesalahan";
      } else {
        throw e.response?.data['message'];
      }
    }
  }

  Future<LoginRegisterResponse?> login(LoginRequest request) async {
    try {
      final Response response =
          await _client.post('/auth/login', data: request.toJson());

      if (response.statusCode == 200) {
        return LoginRegisterResponse.fromJson(response.data);
      }

      return null;
    } on DioError catch (e) {
      if (e.response?.data['message'] == "INVALID_CREDENTIALS") {
        throw "Email atau password salah";
      } else if (e.response?.data['message'] == null) {
        throw "Terjadi kesalahan";
      } else {
        throw e.response?.data['message'];
      }
    }
  }
}
