import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherBox extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;
  const WeatherBox(
      {super.key,
      required this.title,
      required this.value,
      required this.iconData});

  @override
  /// Builds a box with a centered icon and text below it.
  ///
  /// The box is an [Expanded] widget, so it will take up the available space in its parent.
  ///
  /// The box is a [Container] widget with a rounded rectangle decoration.
  ///
  /// The box has the following children:
  ///
  /// 1. A [FaIcon] widget with the given [iconData].
  /// 2. A [SizedBox] widget with a height of 10.
  /// 3. A [Text] widget with the given [title].
  /// 4. A [Text] widget with the given [value].
  ///
  /// The text is centered and has a bold font style with a font size of 18.
  ///
  /// The value is centered and has a normal font style with a font size of 16.
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10)),
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(iconData),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
