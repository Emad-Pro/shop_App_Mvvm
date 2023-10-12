import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocaleDataSource {
  Future<bool> checkLoctionService() async {
    bool serviceLocation = await Geolocator.isLocationServiceEnabled();
    if (!serviceLocation) {
      return serviceLocation;
    }

    return serviceLocation;
  }

  Future<LocationPermission> getLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return permission;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return permission;
    }
    return permission;
  }

  Future getLoctionService() async {
    bool serviceLocation = await Geolocator.isLocationServiceEnabled();

    if (!serviceLocation) {
      await Geolocator.openLocationSettings();
      serviceLocation = await Geolocator.isLocationServiceEnabled();
    }
  }

  Future<LocationDataModel> getCurrentPosition() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    return LocationDataModel.fromJson(
        {"position": position, 'plaseMark': placeMark});
  }
}

class LocationDataModel {
  final Position position;
  final List<Placemark> plaseMark;
  LocationDataModel({required this.position, required this.plaseMark});
  factory LocationDataModel.fromJson(Map<String, dynamic> json) {
    return LocationDataModel(
        position: json['position'], plaseMark: json['plaseMark']);
  }
}
