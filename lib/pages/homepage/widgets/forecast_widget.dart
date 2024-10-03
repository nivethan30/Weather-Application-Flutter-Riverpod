import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import 'forecast_card.dart';

  /// Builds the UI for the forecast details of the [HomePage].
  ///
  /// It takes a [BuildContext] and a [List<Weather>] of the five day forecast.
  ///
  /// It returns a [List<Widget>] with the forecast details.
  ///
  /// The forecast details include a [Text] with the title "Forecast Details",
  /// a [SizedBox] with a [ListView] of [ForecastCard]s, and a [SizedBox] with
  /// a height of 20.
  ///
  /// The [ListView] is built with the [fiveDayWeather] parameter and the
  /// [ForecastCard]s are built by [ForecastCard.build].
List<Widget> fiveDayWeatherDetails(
    BuildContext context, List<Weather> fiveDayWeather) {
  return <Widget>[
    const Text(
      "Forecast Details",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fiveDayWeather.length,
        itemBuilder: (context, index) {
          Weather weather = fiveDayWeather[index];
          return ForecastCard(weather: weather);
        },
      ),
    ),
    const SizedBox(height: 20)
  ];
}
