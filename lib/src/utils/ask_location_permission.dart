import 'package:location/location.dart';

class AskLocationPermission {
  static late PermissionStatus _permissionGranted;
  static final _location = Location();

  static void verifyLocationPermission() async {
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}