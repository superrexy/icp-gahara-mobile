import 'package:dio/dio.dart';
import 'package:icp_gahara_mobile/app/model/request/location_request.dart';
import 'package:icp_gahara_mobile/app/model/response/location_response.dart';

import 'api_client.dart';

class LocationProvider {
  final Dio _client = ApiClient.init();

  Future<LocationDataResponse?> getLocation() async {
    try {
      final Response response = await _client.get("/locations");

      if (response.statusCode == 200) {
        return LocationDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> updateLocation(LocationRequest request) async {
    try {
      final Response response =
          await _client.put("/locations/update", data: request.toJson());

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
