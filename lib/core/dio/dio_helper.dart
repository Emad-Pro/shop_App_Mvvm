import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/language_cache/language_cache.dart';

class DioHelper {
  static Dio? dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? qurey,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      "lang": await LanguageCacheHelper().getCacheLanguageCode()
    };
    return await dio?.get(
      url,
      queryParameters: qurey,
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? qurey,
      String? token,
      Map<String, dynamic>? data}) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
      "lang": await LanguageCacheHelper().getCacheLanguageCode()
    };

    return dio!.post(url, queryParameters: qurey, data: data);
  }

  static Future<Response> deleteData(
      {required String url, Map<String, dynamic>? qurey, String? token}) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
      "lang": await LanguageCacheHelper().getCacheLanguageCode()
    };

    return dio!.delete(url, queryParameters: qurey);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? qurey,
      String? token,
      Map<String, dynamic>? data}) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
      "lang": await LanguageCacheHelper().getCacheLanguageCode()
    };

    return dio!.put(url, queryParameters: qurey, data: data);
  }
}

class ApiService {
  ApiService(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> postData(
      {required String baseUrl, required Map<String, dynamic> data}) async {
    var responce = await _dio.post(baseUrl, data: data);

    return responce.data;
  }
}
