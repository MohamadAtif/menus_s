import 'package:dio/dio.dart';

//http://192.168.1.8:4000/
class ApiService {
  final _baseUrl = Uri.parse('http://192.168.1.8:4000');
  final Dio dio;
  ApiService(this.dio);
//Future<Map<String, dynamic>>
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
