import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/theme_provider.dart';
import '../../../providers/weather_provider.dart';
import '../../search_location.dart';

class AppBarwidget extends ConsumerWidget implements PreferredSizeWidget {
  final ThemeMode themeMode;
  const AppBarwidget(this.themeMode, {super.key});

  @override
  /// Builds the app bar widget with the title, theme switch, and search button
  ///
  /// The app bar is transparent with no elevation.
  ///
  /// The title is a [Text] widget with the text 'Weather App' and a bold font style
  /// with a font size of 20. The color of the text is determined by the
  /// [ThemeMode] of the app.
  ///
  /// The theme switch is a [Switch] widget with a value that is true if the
  /// [ThemeMode] is dark, and false if the [ThemeMode] is light. When the switch
  /// is changed, the [ThemeMode] is updated accordingly.
  ///
  /// The search button is an [IconButton] widget with an icon of a magnifying
  /// glass. When the button is pressed, a dialog is shown with a search bar to
  /// enter a city name. The search bar is a [SearchLocation] widget.
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0,
      backgroundColor:Colors.transparent,
      title: Text(
        'Weather App',
        style: TextStyle(
            color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        Switch(
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              if (value == true) {
                ref
                    .read(themeProviderNotifier.notifier)
                    .setTheme(ThemeMode.dark);
              } else {
                ref
                    .read(themeProviderNotifier.notifier)
                    .setTheme(ThemeMode.light);
              }
            },
            activeColor: Colors.white),
        IconButton(
            onPressed: () {
              ref.read(cityNameProvider.notifier).state = null;
            },
            icon: const Icon(Icons.location_on, color: Colors.white)),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        content: const SearchLocation(),
                      ));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
