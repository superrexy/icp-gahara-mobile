import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:icp_gahara_mobile/app/data/api_client.dart';
import 'package:icp_gahara_mobile/app/model/request/cars_request.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';

class CarsProvider {
  final Dio _client = ApiClient.init();

  Future<List<CarsDataResponse>?> getCars() async {
    try {
      final Response response = await _client.get("/cars");

      if (response.statusCode == 200) {
        final jsonResponse = response.data['data'] as List;
        return jsonResponse.map((e) => CarsDataResponse.fromJson(e)).toList();
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<CarsDataResponse?> getCarByID(int carId) async {
    try {
      final Response response = await _client.get("/cars/$carId");

      if (response.statusCode == 200) {
        return CarsDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> createCar(CarsRequest request) async {
    try {
      final fileName = request.carImage!.path.split('/').last;
      final extFile = fileName.split('.').last;

      final formData = FormData.fromMap({
        'name': request.name,
        'price': request.price,
        'description': request.description,
        'seats': request.seats,
        'type_fuel': request.typeFuel,
        'type_car': request.typeCar,
        'transmision': request.transmision,
        'car_image': MultipartFile.fromBytes(
          request.carImage!.readAsBytesSync(),
          filename: fileName,
          contentType: MediaType('image', extFile),
        ),
      });

      final Response response =
          await _client.post("/cars/create", data: formData);

      if (response.statusCode == 201) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> updateCar(int carId, CarsRequest request) async {
    try {
      if (request.carImage == null) {
        final Response response =
            await _client.put("/cars/$carId/update", data: request.toJson());

        if (response.statusCode == 200) {
          return true;
        }

        return false;
      }

      final fileName = request.carImage!.path.split('/').last;
      final extFile = fileName.split('.').last;

      final formData = FormData.fromMap({
        'name': request.name,
        'price': request.price,
        'description': request.description,
        'seats': request.seats,
        'type_fuel': request.typeFuel,
        'type_car': request.typeCar,
        'transmision': request.transmision,
        'car_image': MultipartFile.fromBytes(
          request.carImage!.readAsBytesSync(),
          filename: fileName,
          contentType: MediaType('image', extFile),
        ),
      });

      final Response response =
          await _client.put("/cars/$carId/update", data: formData);

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> deleteCar(int carId) async {
    try {
      final Response response = await _client.delete("/cars/$carId/delete");

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
