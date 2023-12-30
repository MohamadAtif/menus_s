import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.7:3000';
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
