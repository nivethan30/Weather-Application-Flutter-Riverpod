import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'homepage/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  /// Initializes the [StatefulWidget] and schedules a 3 second delay before
  /// navigating to the [HomePage].
  ///
  /// This method is called when the [StatefulWidget] is inserted into the tree.
  ///
  /// It calls [super.initState] to initialize the parent class.
  ///
  /// It then waits for a 3 second [Duration] before calling [_navigateToHomePage],
  /// which navigates to the [HomePage] by pushing a [MaterialPageRoute] to the
  /// current [Navigator].
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _navigateToHomePage();
    });
  }

  /// Navigates to the [HomePage] by pushing a [MaterialPageRoute] to the
  /// current [Navigator].
  ///
  /// This method is called when the 3 second [Duration] in [initState] has
  /// completed.
  void _navigateToHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  /// Builds the UI for the [SplashScreen].
  ///
  /// It returns a [Scaffold] with a [Color] of #0D254F and a [Center] widget
  /// containing a [SizedBox] with a height and width of 250 and an [Image] of
  /// [Assets.weatherImage] centered in the [SizedBox].
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 37, 63),
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Center(
            child: Image.asset(Assets.weatherImage),
          ),
        ),
      ),
    );
  }
}
