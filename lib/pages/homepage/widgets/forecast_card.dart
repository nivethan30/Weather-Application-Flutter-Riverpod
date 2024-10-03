import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import '../../../utils/constants.dart';

class ForecastCard extends StatelessWidget {
  final Weather weather;
  const ForecastCard({super.key, required this.weather});

  @override
  /// Builds a forecast card widget.
  ///
  /// The card is a [Container] widget with a rounded rectangle decoration.
  ///
  /// The card has the following children:
  ///
  /// 1. An [Image] widget with the weather icon.
  /// 2. A [Text] widget with the weather main description.
  /// 3. A [Text] widget with the date of the forecast.
  /// 4. A [Text] widget with the time of the forecast.
  ///
  /// The text is centered and has a bold font style with a font size of 18.
  ///
  /// The date and time are centered and have a normal font style with a font size of 16.
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      height: 100,
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 75,
            width: 75,
            child: Image.network(
              "http://openweathermap.org/img/wn/${weather.weatherIcon}@4x.png",
            ),
          ),
          Text(
            weather.weatherMain ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(formatDateTime(weather.date!),
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          Text(formatTime(weather.date!),
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}
