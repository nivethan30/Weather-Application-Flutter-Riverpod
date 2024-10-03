import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A provider that stores the current theme mode.
///
/// This provider is used to switch the app's theme between light and dark mode.
///
/// The provider is initialized with the light theme as the default theme.
///
/// The provider is used in the [MyApp] widget to set the theme of the
/// [MaterialApp] widget.
///
/// The provider is also used in the [HomePage] widget to display the
/// current theme mode in the app bar.
final themeProviderNotifier =
    StateNotifierProvider<ThemeProvider, ThemeMode>((ref) => ThemeProvider());

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider() : super(ThemeMode.light) {
    loadTheme();
  }
  /// Toggle the theme between light and dark mode.
  void toggleTheme() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
  }

  /// Set the current theme to the specified [ThemeMode] and
  /// save the chosen theme to local storage.
  void setTheme(ThemeMode themeMode) {
    state = themeMode;
    saveTheme();
  }

  /// Save the chosen theme to local storage. The theme is saved as an integer
  /// value, 0 for light theme and 1 for dark theme.
  Future<void> saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', state == ThemeMode.light ? 0 : 1);
  }

  /// Load the saved theme from local storage. If a theme is saved, it
  /// updates the state of the [ThemeProvider] with the saved theme. If no
  /// theme is saved, the theme remains in its default state as light theme.
  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? theme = prefs.getInt('theme');
    if (theme != null) {
      theme == 0 ? state = ThemeMode.light : state = ThemeMode.dark;
    }
  }
}
