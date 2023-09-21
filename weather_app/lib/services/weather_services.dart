import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class Weathersevices {
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = 'a4cc42682eb04d9e91d194659231908%20';

  Dio dio = Dio();

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    ;
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps thier was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps thier was an error, try later');
    }
  }
}
