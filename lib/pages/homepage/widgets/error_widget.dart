import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import '../../../providers/weather_provider.dart';

class ErrorStackTraceWidget extends ConsumerWidget {
  final Object error;
  final StackTrace stackTrace;
  final ThemeMode themeMode;
  const ErrorStackTraceWidget(
      {required this.error,
      required this.stackTrace,
      required this.themeMode,
      super.key});

  @override
  /// Builds a [Center] widget with a centered [Column] containing an error
  /// message and a [ElevatedButton] to go back to the previous page.
  ///
  /// The error message is determined by the given [error]:
  ///
  /// * If [error] is an [OpenWeatherAPIException], the error message is
  ///   determined by the 'message' key in the JSON data of the exception.
  /// * If [error] is not an [OpenWeatherAPIException], the error message is
  ///   'An unexpected error occurred: $error'.
  ///
  /// The button is an [ElevatedButton] with the label 'Go Back', which pops
  /// the current route when pressed.
  Widget build(BuildContext context, WidgetRef ref) {
    String message;

    if (error is OpenWeatherAPIException) {
      final jsonString = error.toString();
      final Map<String, dynamic> errorData =
          jsonDecode(jsonString.split(': ').last);
      message = errorData['message'] ?? 'An unknown error occurred';
    } else {
      message = 'An unexpected error occurred: $error';
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
              onPressed: () {
                ref.read(cityNameProvider.notifier).state = null;
              },
              child: const Text('Go Back'))
        ],
      ),
    );
  }
}
