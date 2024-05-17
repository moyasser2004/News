import 'package:dio/dio.dart';

// baserUrl = https://newsapi.org/

abstract class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> query,
    Map<String, dynamic>? data,
  }) async {
    return await dio!.post(url, queryParameters: query, data: data);
  }
}
