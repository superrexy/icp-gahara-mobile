import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:icp_gahara_mobile/app/data/api_client.dart';
import 'package:icp_gahara_mobile/app/model/request/users_request.dart';
import 'package:icp_gahara_mobile/app/model/response/users_response.dart';

class UsersProvider {
  final Dio _client = ApiClient.init();

  Future<UsersDataResponse?> profile() async {
    try {
      final Response response = await _client.get("/users/profile");

      if (response.statusCode == 200) {
        return UsersDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<UsersDataResponse?> updateProfile(
      UsersRequest request, File? image) async {
    try {
      if (image != null) {
        final fileName = image.path.split('/').last;
        final extFile = fileName.split('.').last;

        final formData = FormData.fromMap({
          'full_name': request.fullName,
          'address': request.address,
          'phone': request.phone,
          'user_image': MultipartFile.fromBytes(
            image.readAsBytesSync(),
            filename: fileName,
            contentType: MediaType('image', extFile),
          ),
        });

        final Response response =
            await _client.put("/users/profile", data: formData);

        if (response.statusCode == 200) {
          return UsersDataResponse.fromJson(response.data['data']);
        }

        return null;
      }

      final Response response =
          await _client.put("/users/profile", data: request.toJson());

      if (response.statusCode == 200) {
        return UsersDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
