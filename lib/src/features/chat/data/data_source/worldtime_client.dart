import 'dart:convert';

import 'package:dio/dio.dart';

class WorldTimeClient {
  final Dio _dio;

  WorldTimeClient({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> getWorldTime() async {
    Response response =
        await _dio.get('https://worldtimeapi.org/api/timezone/Asia/Seoul');

    return response.data;
  }
}
