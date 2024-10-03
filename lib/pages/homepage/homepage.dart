import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/error_widget.dart';
import 'widgets/appbar.dart';
import '../../models/weather_list_model.dart';
import '../../providers/theme_provider.dart';
import 'widgets/forecast_widget.dart';
import 'widgets/loading_widget.dart';
import '../../providers/weather_provider.dart';
import 'widgets/weather_widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override

  /// Builds the [Scaffold] widget with the current [ThemeMode] and [weather] data.
  ///
  /// If [weather] is not available, it displays a [LoadingWidget].
  ///
  /// If [weather] is available, it calls [_buildUI] to build the UI.
  ///
  /// If [weather] has an error, it calls [ErrorStackTraceWidget] to display the error.
  Widget build(BuildContext context, WidgetRef ref) {
    final cityName = ref.watch(cityNameProvider);
    final weather = ref.watch(weatherProvider(cityName));
    final ThemeMode themeMode = ref.watch(themeProviderNotifier);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBarwidget(themeMode),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: weather.when(
            data: (data) {
              return _buildUI(context, data, ref, themeMode);
            },
            error: (error, stackTrace) => ErrorStackTraceWidget(
              error: error,
              stackTrace: stackTrace,
              themeMode: themeMode,
            ),
            loading: () => const LoadingWidget(),
          ),
        ),
      ),
    );
  }

  /// Builds the UI for the [HomePage].
  ///
  /// It takes a [BuildContext], [FinalWeather] data, a [WidgetRef] to access the
  /// providers, and a [ThemeMode].
  ///
  /// It returns a [Column] widget with the weather details and the 5-day forecast.
  ///
  /// The weather details are built by [_weatherDetails].
  ///
  /// The 5-day forecast is built by [_fiveDayWeatherDetails].
  ///
  /// The UI is built only if the [FinalWeather] data is available.
  Widget _buildUI(BuildContext context, FinalWeather finalweather,
      WidgetRef ref, ThemeMode themeMode) {
    return Column(
      children: [
        ...weatherDetails(context: context, weather: finalweather.weather),
        ...fiveDayWeatherDetails(context, finalweather.fiveDayWeather)
      ],
    );
  }
}
