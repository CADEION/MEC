import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const Map<String, dynamic> DEFAULT_HEADERS = {
  "Content-Type": "application/json"
};

class Api {
  final _dio = Dio();
  

  Api() {
    _dio.options.baseUrl = 'http://192.168.0.191:5000/api/';
    _dio.options.headers = DEFAULT_HEADERS;
    _dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true));
  }
  Dio get sendRequest => _dio;
}

class ApiResponse{
   bool success;
   dynamic data;
   String? message;

  ApiResponse({required this.success,  this.data,  this.message});

  factory ApiResponse.fromResponse(Response response){
    final data = response.data as Map<String , dynamic>;
    return ApiResponse(
      success: data['success'],
      data : data["data"],
      message : data["message"] ?? "Unexpected Error",
      );
  }

}
