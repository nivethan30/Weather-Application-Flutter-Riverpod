import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final locationProvider = FutureProvider<Position>((ref) async {
  // Check if location service is enabled
  if (!await Geolocator.isLocationServiceEnabled()) {
    throw Exception("Location Service is Not Available");
  }

  // Get the current permission status
  LocationPermission permission = await Geolocator.checkPermission();

  // If permission is denied, request permission
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  // If permission is not granted, throw an exception
  if (permission != LocationPermission.whileInUse &&
      permission != LocationPermission.always) {
    throw Exception('Location permissions are denied');
  }

  // If permission is granted, get the current position
  return await Geolocator.getCurrentPosition();
});
