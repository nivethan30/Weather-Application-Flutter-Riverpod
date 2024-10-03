import 'package:weather/weather.dart';

class FinalWeather {
  final Weather weather;
  final List<Weather> fiveDayWeather;
  FinalWeather({required this.weather, required this.fiveDayWeather});
}