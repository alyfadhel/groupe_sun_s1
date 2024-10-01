import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

 static Future<Response> getData({
   required String url,
   Map<String, dynamic>? query,
   required Map<String, dynamic> data,
   String? token ,
   String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'Authorization' : token ?? '',
      'lang' : lang
    };
   return await dio.get(
      url,
      queryParameters: query,
     data: data,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token ,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'Authorization' : token ?? '',
      'lang' : lang
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token ,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'Authorization' : token ?? '',
      'lang' : lang
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
////////////////////////////////////////////////////
class NewsDioHelper {
  static late Dio dio;

  static init() {
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
  })async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}