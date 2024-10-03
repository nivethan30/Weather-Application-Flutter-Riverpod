import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  /// Builds a [Column] widget with a centered beat loading animation widget
  /// and an animated text "Fetching weather..."
  ///
  /// The loading animation widget is white with size 100.
  ///
  /// The animated text is displayed with a font size of 25 and a speed of
  /// 100 milliseconds.
  ///
  /// The two widgets are separated by a 50 pixels high [SizedBox].
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        loadingWidget(),
        const SizedBox(height: 50),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText('Fetching weather...',
                speed: const Duration(milliseconds: 100),
                textStyle: const TextStyle(fontSize: 25)),
          ],
        )
      ],
    );
  }

  

  /// A centered beat loading animation widget with white color and size 100.
  ///
  /// See also:
  /// - [LoadingAnimationWidget.beat]
  /// - [Center]
Widget loadingWidget() {
  return Center(
    child: LoadingAnimationWidget.beat(color: Colors.white, size: 100),
  );
}
}