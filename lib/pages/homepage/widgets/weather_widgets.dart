import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/weather.dart';
import '../../../utils/constants.dart';
import 'weather_box.dart';

/// Returns a list of widgets that display the given [weather] data.
///
/// The widgets include:
///
/// * The city name and country
/// * The current date
/// * The current weather icon
/// * The current temperature in Celsius
/// * A row of weather boxes displaying the weather description, min and max temperatures, sunrise and sunset times, humidity and pressure
/// * A row of weather boxes displaying the last hour and last 3 hours of rain
/// * A row of weather boxes displaying the wind speed, wind gust, and cloudiness
///
/// The widgets are returned as a list, so they can be used in a [Column] or [ListView] widget.
List<Widget> weatherDetails(
    {required BuildContext context, required Weather weather}) {
  return <Widget>[
    const SizedBox(height: 20),
    Text(
      "${weather.areaName}, ${weather.country}",
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      formatDateTime(weather.date!),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    ),
    SizedBox(
      height: 150,
      width: 150,
      child: Image.network(
        "http://openweathermap.org/img/wn/${weather.weatherIcon}@4x.png",
      ),
    ),
    Text(
      "${weather.temperature!.celsius!.toStringAsFixed(0)}°C",
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherBox(
          title: 'Weather',
          value: weather.weatherMain ?? "No main weather",
          iconData: FontAwesomeIcons.cloud,
        ),
        WeatherBox(
          title: 'Description',
          value: weather.weatherDescription ?? "No description",
          iconData: FontAwesomeIcons.circleInfo,
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherBox(
          title: 'Min Temp',
          value: "${weather.tempMin!.celsius!.toStringAsFixed(0)}°C",
          iconData: FontAwesomeIcons.temperatureHalf,
        ),
        WeatherBox(
          title: 'Max Temp',
          value: "${weather.tempMax!.celsius!.toStringAsFixed(0)}°C",
          iconData: FontAwesomeIcons.temperatureFull,
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherBox(
          title: 'Sunrise At',
          value: formatTime(weather.sunrise!),
          iconData: FontAwesomeIcons.solidSun,
        ),
        WeatherBox(
          title: 'Sunset At',
          value: formatTime(weather.sunset!),
          iconData: FontAwesomeIcons.mountainSun,
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherBox(
          title: 'Humidity',
          value: "${weather.humidity}%",
          iconData: FontAwesomeIcons.water,
        ),
        WeatherBox(
          title: 'Pressure',
          value: "${weather.pressure} hPa",
          iconData: FontAwesomeIcons.gauge,
        )
      ],
    ),
    const SizedBox(height: 10),
    const Text(
      "Rain Details",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherBox(
          title: 'Last Hour',
          value: weather.rainLastHour == null
              ? "No rain data"
              : "${weather.rainLastHour} mm",
          iconData: FontAwesomeIcons.cloudRain,
        ),
        WeatherBox(
          title: 'Last 3 Hours',
          value: weather.rainLast3Hours == null
              ? "No rain data"
              : "${weather.rainLast3Hours} mm",
          iconData: FontAwesomeIcons.cloudRain,
        )
      ],
    ),
    const SizedBox(height: 10),
    const Text(
      "Wind Details",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherBox(
          title: 'Wind Speed',
          value: "${weather.windSpeed} m/s",
          iconData: FontAwesomeIcons.wind,
        ),
        WeatherBox(
          title: 'Wind Degree',
          value: "${weather.windDegree}°",
          iconData: FontAwesomeIcons.compass,
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherBox(
          title: 'Wind Gust',
          value: "${weather.windGust} m/s",
          iconData: FontAwesomeIcons.wind,
        ),
        WeatherBox(
          title: 'Cloudiness',
          value: "${weather.cloudiness}%",
          iconData: FontAwesomeIcons.cloud,
        )
      ],
    ),
    const SizedBox(height: 10),
  ];
}
