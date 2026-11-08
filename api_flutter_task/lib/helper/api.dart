import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();

  Future<dynamic> get({required String url, String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) headers.addAll({"Authorization": "Bearer $token"});
    try {
      Response response = await _dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
          " there is a problem with statusCode ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      throw Exception(
        " there is a problem with statusCode ${e.response?.statusCode} with body ${e.response?.data}",
      );
    }
  }


  Future<dynamic> post({required String url,dynamic body, String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) headers.addAll({"Authorization": "Bearer $token"});
    try {
      Response response = await _dio.post(url,data:body, options: Options(headers: headers));
      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception(
          " there is a problem with statusCode ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      throw Exception(
        " there is a problem with statusCode ${e.response?.statusCode} with body ${e.response?.data}",
      );
    }
  }

  Future<dynamic> delete({required String url, dynamic body, String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) headers.addAll({"Authorization": "Bearer $token"});
    try {
      Response response = await _dio.delete(url, data: body, options: Options(headers: headers));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
          " there is a problem with statusCode ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      throw Exception(
        " there is a problem with statusCode ${e.response?.statusCode} with body ${e.response?.data}",
      );
    }
  }

}
