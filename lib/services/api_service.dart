import 'package:dio/dio.dart';

//http://192.168.1.8:4000/
class ApiService {
  final _baseUrl = Uri.parse('http://192.168.1.8:6000');
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }

//required TextEditingController name,
  Future<Map<String, dynamic>> addPlace({
    required String endPoint,
    required String name,
    required String description,
    required String location,
  }) async {
    print('START api service');
    var response = await dio.post('$_baseUrl$endPoint', data: {
      "name": name,
      "description": description,
      "location": location,
    });
    print('end api;');

    return response.data;
  }

  Future<Map<String, dynamic>> deletePlace({
    required String endPoint,
  }) async {
    var response = await dio.post(
      '$_baseUrl$endPoint',
    );
    return response.data;
  }
}
