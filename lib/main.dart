import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'pages/splash_screen.dart';
import 'utils/theme.dart';

/// The main entrypoint of the application.
///
/// This function loads the environment variables from a .env file
/// located in the assets directory and runs the app with the
/// [ProviderScope] widget.
Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override

  /// Builds the main [MaterialApp] widget with the chosen [ThemeMode]
  /// and the [SplashScreen] as the home route.
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeProviderNotifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeMode,
      home: const SplashScreen(),
    );
  }
}
