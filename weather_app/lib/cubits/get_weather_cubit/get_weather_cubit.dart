import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/weather_model.dart';
import '../../services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await Weathersevices().getCurrentWeather(cityName: cityName);
      emit(GetWeatherSuccess());
    } catch (e) {
      emit(GetWeatherFaild());
    }
  }
}
