import 'package:dio/dio.dart';

import '../sheared_preference/shearedprefrence_services.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    String baseUrl = 'https://lavie.orangedigitalcenteregypt.com/api/';
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.plain,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${SharedPreferencesHelper.getData(key: 'token')}',
        }));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${SharedPreferencesHelper.getData(key: 'token')}',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) {
    dio.options.headers = {
      'Authorization':
          'Bearer ${SharedPreferencesHelper.getData(key: 'token')}',
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${SharedPreferencesHelper.getData(key: 'token')}',
    };
    return dio.post(url, queryParameters: query, data: data);
  }
}
