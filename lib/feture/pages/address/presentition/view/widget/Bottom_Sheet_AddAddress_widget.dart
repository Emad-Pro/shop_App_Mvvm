import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/home/view_model/cubit/home_cubit.dart';

import '../../../../../../../../../core/widget/custom_buttom.dart';
import '../../../../../../../../../core/widget/custom_loading.dart';

import '../../../data/model/address_model/datum.dart';
import '../../view_model/bloc/address_bloc.dart';
import '../../view_model/cubit/location_cubit.dart';
import 'Failed_address_widget.dart';

class BottomSheetAddAddress extends StatelessWidget {
  const BottomSheetAddAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(context: context, builder: (context) => BottomSheetItem());
      },
      child: Icon(Icons.add),
    );
  }
}

// ignore: must_be_immutable
class BottomSheetItem extends StatelessWidget {
  BottomSheetItem({
    Key? key,
  }) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameAddress = TextEditingController();
    TextEditingController cityAddress = TextEditingController();
    TextEditingController regionAddress = TextEditingController();
    TextEditingController detailsAddress = TextEditingController();
    TextEditingController phoneAddress = TextEditingController();
    TextEditingController lateAddress = TextEditingController();
    TextEditingController longAddress = TextEditingController();
    return BlocListener<HomeCubit, HomeState>(
      listener: (contexta, homeState) {
        if (homeState is HomeBottomNavigatorBarChangeState) {
          Navigator.pop(context);
        }
      },
      child: BlocConsumer<LocationCubit, LocationServiceCubitState>(
        listener: (context, locationstate) {
          serviceNotifcation(locationstate, context, nameAddress, cityAddress, regionAddress,
              detailsAddress, lateAddress, longAddress);
        },
        builder: (context, locationstate) {
          return Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "addNewAddress".tr(context).toUpperCase(),
                              style: TextStyle(
                                  fontSize: 15 * MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                      FiledAddress(
                        nameAddress: nameAddress,
                        cityAddress: cityAddress,
                        regionAddress: regionAddress,
                        detailsAddress: detailsAddress,
                        phoneAddress: phoneAddress,
                        lateAddress: lateAddress,
                        longAddress: longAddress,
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (locationstate is LocationAddressLoading)
                                    const Expanded(child: LoadingWidget())
                                  else if (locationstate is! LocationAddressLoading)
                                    CustomButtom(
                                      widget: Text("autoComplete".tr(context).toUpperCase()),
                                      color: Colors.amber[900],
                                      onPressed: () async {
                                        BlocProvider.of<LocationCubit>(context).getGpsService();
                                      },
                                    ),
                                  if (locationstate is! LocationAddressLoading) Spacer(),
                                  if (locationstate is! LocationAddressLoading)
                                    CustomButtom(
                                      widget: Text("add".tr(context).toUpperCase()),
                                      color: Colors.deepOrangeAccent,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          addAddressMethod(
                                              context,
                                              cityAddress,
                                              nameAddress,
                                              regionAddress,
                                              detailsAddress,
                                              phoneAddress,
                                              lateAddress,
                                              longAddress);
                                        }
                                      },
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomButtom(
                              width: double.infinity,
                              widget: Text("clear".tr(context).toUpperCase()),
                              color: Colors.red[600],
                              onPressed: () {
                                clearFaild(cityAddress, nameAddress, regionAddress, detailsAddress,
                                    phoneAddress, lateAddress, longAddress);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void serviceNotifcation(
      LocationServiceCubitState state,
      BuildContext context,
      TextEditingController nameAddress,
      TextEditingController cityAddress,
      TextEditingController regionAddress,
      TextEditingController detailsAddress,
      TextEditingController lateAddress,
      TextEditingController longAddress) {
    if (state is GpsServiceErorrState) {
      if (state.gpsService == false) {
        showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context2) {
            return ClassicGeneralDialogWidget(
              titleText: 'gps'.tr(context).toUpperCase(),
              negativeText: "close".tr(context).toUpperCase(),
              positiveText: "openSetting".tr(context).toUpperCase(),
              contentText: 'YouNeedToTurnOnTheGPSService'.tr(context).toUpperCase(),
              onNegativeClick: () {
                Navigator.of(context).pop();
              },
              onPositiveClick: () {
                BlocProvider.of<LocationCubit>(context).openGpsSetting();
                Navigator.of(context).pop();
              },
            );
          },
          animationType: DialogTransitionType.size,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 0),
        );
      }
    }
    if (state is LocationPermissionErorrState) {
      if (state.locationPermission != LocationPermission.always ||
          state.locationPermission != LocationPermission.whileInUse) {
        showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return ClassicGeneralDialogWidget(
              titleText: 'gps'.tr(context).toUpperCase(),
              negativeText: "close".tr(context).toUpperCase(),
              contentText: 'youNeedPermissions'.tr(context).toUpperCase(),
              onNegativeClick: () {
                Navigator.of(context).pop();
              },
            );
          },
          animationType: DialogTransitionType.size,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 0),
        );
      }
    }
    if (state is LocationAddressSuccess) {
      addValueToField(
          state, nameAddress, cityAddress, regionAddress, detailsAddress, lateAddress, longAddress);
    }
  }

  void clearFaild(
      TextEditingController cityAddress,
      TextEditingController nameAddress,
      TextEditingController regionAddress,
      TextEditingController detailsAddress,
      TextEditingController phoneAddress,
      TextEditingController lateAddress,
      TextEditingController longAddress) {
    cityAddress.clear();
    nameAddress.clear();
    regionAddress.clear();
    detailsAddress.clear();
    phoneAddress.clear();
    lateAddress.clear();
    longAddress.clear();
  }

  void addValueToField(
      LocationAddressSuccess state,
      TextEditingController nameAddress,
      TextEditingController cityAddress,
      TextEditingController regionAddress,
      TextEditingController detailsAddress,
      TextEditingController lateAddress,
      TextEditingController longAddress) {
    final Placemark plaseMark = state.placemark;

    nameAddress.text = state.placemark.name!;
    cityAddress.text = plaseMark.country!;
    regionAddress.text = plaseMark.locality!;
    detailsAddress.text = plaseMark.street!;
    lateAddress.text = state.position.latitude.toString();
    longAddress.text = state.position.longitude.toString();
  }

  void addAddressMethod(
      BuildContext context,
      TextEditingController cityAddress,
      TextEditingController nameAddress,
      TextEditingController regionAddress,
      TextEditingController detailsAddress,
      TextEditingController phoneAddress,
      TextEditingController lateAddress,
      TextEditingController longAddress) {
    BlocProvider.of<AddressBloc>(context).add(
      NewAddressEvent(
        dataAddress: DataAddress(
          city: cityAddress.text,
          name: nameAddress.text,
          region: regionAddress.text,
          details: detailsAddress.text,
          notes: phoneAddress.text,
          latitude: lateAddress.text,
          longitude: longAddress.text,
        ),
      ),
    );
  }
}
