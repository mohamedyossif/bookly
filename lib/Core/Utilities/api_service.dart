import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  // singlton pattern using static
  static ApiService? instance;
  ApiService._private(this._dio);
  factory ApiService() {
    // assign instance if instance = null
    // one object from Dio and ApiService for all Application
    return instance ??= ApiService._private(Dio());
  }
  // formal Api
  Future<Response> get({required String endPoint}) async {
    Response<Map<String, dynamic>> response =
        await _dio.get('$_baseUrl$endPoint');
    return response;
  }
}
