import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../../../../../core/service/location/location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationServiceCubitState> {
  LocationCubit(this.localeDataSource) : super(const LocationServiceCubitState());
  final LocaleDataSource localeDataSource;
  Future getGpsService() async {
    emit(GpsServiceLoadingState());
    final result = await localeDataSource.checkLoctionService();
    if (result == false) {
      emit(GpsServiceErorrState(result));
    } else if (result == true) {
      emit(GpsServiceSuccessState(result));
      getPermissionService();
    }
  }

  Future openGpsSetting() async {
    await localeDataSource.getLoctionService();
  }

  Future getLocation() async {
    emit(LocationAddressLoading());
    await localeDataSource.getCurrentPosition().then((value) {
      emit(LocationAddressSuccess(placemark: value.plaseMark[0], position: value.position));
    }).catchError((onError) {
      emit(LocationAddressErorr());
    });
  }

  Future getPermissionService() async {
    final resultPermission = await localeDataSource.getLocationPermission();
    if (resultPermission == LocationPermission.always ||
        resultPermission == LocationPermission.whileInUse) {
      emit(LocationPermissionSuccessState());
      getLocation();
    } else {
      emit(LocationPermissionErorrState(locationPermission: resultPermission, gpsService: true));
    }
  }
}
