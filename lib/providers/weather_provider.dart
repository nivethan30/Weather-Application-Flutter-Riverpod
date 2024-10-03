import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import '../models/weather_list_model.dart';
import 'location_provider.dart';

final cityNameProvider = StateProvider<String?>((ref) => null);

final weatherProvider =
    FutureProvider.family<FinalWeather, String?>((ref, cityName) async {
  final String apiKey = dotenv.env['API_KEY']!;
  WeatherFactory wf = WeatherFactory(apiKey);
  if (cityName != null && cityName.isNotEmpty) {
    // Fetch weather by city name
    Weather weather = await wf.currentWeatherByCityName(cityName);
    List<Weather> fiveDayWeather = await wf.fiveDayForecastByCityName(cityName);
    return FinalWeather(weather: weather, fiveDayWeather: fiveDayWeather);
  } else {
    // Fetch weather by location
    final Position position = await ref.watch(locationProvider.future);
    Weather weather = await wf.currentWeatherByLocation(
        position.latitude, position.longitude);
    List<Weather> fiveDayWeather = await wf.fiveDayForecastByLocation(
        position.latitude, position.longitude);
    return FinalWeather(weather: weather, fiveDayWeather: fiveDayWeather);
  }
});
