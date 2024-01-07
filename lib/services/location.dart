import 'package:geolocator/geolocator.dart';

class Location {
  double lon = 0, lat = 0;
  Future getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lon = position.longitude;
      lat = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
