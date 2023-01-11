import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:icp_gahara_mobile/app/common/storage/storage.dart';
import 'package:icp_gahara_mobile/app/common/values/app_constants.dart';

class ApiClient {
  static Dio init() {
    final dio = Dio();
    dio.options.baseUrl = AppConstants.baseAPIURL;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(ApiInterceptors());
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    EasyLoading.show(status: 'Loading ...');

    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }

    // Token
    final token = Storage.getValue(AppConstants.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    EasyLoading.dismiss();

    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    EasyLoading.dismiss();

    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
