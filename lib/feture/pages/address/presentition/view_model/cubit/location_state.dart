part of 'location_cubit.dart';

class LocationServiceCubitState extends Equatable {
  const LocationServiceCubitState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationServiceCubitState {}

class GpsServiceLoadingState extends LocationServiceCubitState {}

class GpsServiceSuccessState extends LocationServiceCubitState {
  final bool gpsService;

  const GpsServiceSuccessState(this.gpsService);
}

class GpsServiceErorrState extends LocationServiceCubitState {
  final bool gpsService;

  const GpsServiceErorrState(this.gpsService);
}

class LocationPermissionLoadingState extends LocationServiceCubitState {}

class LocationPermissionSuccessState extends LocationServiceCubitState {}

class LocationPermissionErorrState extends LocationServiceCubitState {
  final bool gpsService;
  final LocationPermission locationPermission;

  const LocationPermissionErorrState(
      {required this.gpsService, required this.locationPermission});
}

class LocationAddressSuccess extends LocationServiceCubitState {
  final Placemark placemark;
  final Position position;

  const LocationAddressSuccess(
      {required this.placemark, required this.position});
}

class LocationAddressLoading extends LocationServiceCubitState {}

class LocationAddressErorr extends LocationServiceCubitState {}
