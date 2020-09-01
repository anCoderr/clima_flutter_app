import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  Position position;

  Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    }
  }
}
