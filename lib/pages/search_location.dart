import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weather_provider.dart';

class SearchLocation extends ConsumerWidget {
  const SearchLocation({super.key});

  @override
  /// Builds a search dialog to search for a city by name.
  ///
  /// It includes a [TextField] to enter the city name and two
  /// [ElevatedButton]s: one to cancel the search and return to the
  /// previous page, and another to perform the search.
  ///
  /// When the search button is pressed, the [cityNameProvider] is
  /// updated with the entered city name, and the dialog is popped.
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Text(
              'Search For City Name',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(),
                  hintText: 'Enter city (Eg. London)',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(cityNameProvider.notifier).state =
                        controller.text.isNotEmpty ? controller.text : null;
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Search",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
