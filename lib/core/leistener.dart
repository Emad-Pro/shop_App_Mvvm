import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/enum.dart';
import 'package:shop_app_mvvm/core/methods/snackBar.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view_model/bloc/address_bloc.dart';

import '../feture/pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import '../feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';

BlocListener<FavoritesBloc, FavoritesState> listenerFavoritesMethod() {
  return BlocListener<FavoritesBloc, FavoritesState>(
    listener: (context, state) {
      if (state.favoritesModifiyProductState == RequestStateCart.loadedState) {
        snackBarCustomMethod(
            context: context,
            textMessage:
                "${"favorite".tr(context)}:${state.favoritesModifiyProductModel!.message!.tr(context)}");
        BlocProvider.of<FavoritesBloc>(context).add(GetFavoritesDataEvent(false));
        EasyLoading.dismiss(animation: true);
      } else if (state.favoritesModifiyProductState == RequestStateCart.loadingState) {
        EasyLoading.show(
          status: "Loading.....".tr(context),
          maskType: EasyLoadingMaskType.black,
        );
      }
    },
  );
}

BlocListener<CartsBloc, CartsState> listenerCartsMethod() {
  return BlocListener<CartsBloc, CartsState>(
    listener: (context, statea) {
      if (statea.cartModifiyState == RequestStateCart.loadedState) {
        snackBarCustomMethod(
            context: context,
            textMessage: "${"cart".tr(context)}:${statea.cartModifiyModel!.message!}");
        BlocProvider.of<CartsBloc>(context).add(CartsGetDataEvent(false));
        EasyLoading.dismiss(animation: true);
      } else if (statea.cartModifiyState == RequestStateCart.loadingState) {
        EasyLoading.show(
          status: "Loading.....".tr(context),
          maskType: EasyLoadingMaskType.black,
        );
      }
    },
  );
}

void coustomListenerAddress(context, state) {
  if (state.addressNewState == RequestStateCart.loadedState) {
    BlocProvider.of<AddressBloc>(context).add(const GetAddressEvent(isReload: false));
    EasyLoading.dismiss();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.addressNewModel!.message!)),
    );
    Navigator.pop(context);
  } else if (state.addressDeleteState == RequestStateCart.loadedState) {
    BlocProvider.of<AddressBloc>(context).add(const GetAddressEvent(isReload: false));
    EasyLoading.dismiss();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.addressDeleteModel!.message!)),
    );
  } else if (state.addressUpdateState == RequestStateCart.loadedState) {
    BlocProvider.of<AddressBloc>(context).add(const GetAddressEvent(isReload: false));
    EasyLoading.dismiss();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(state.addressUpdateModel!.message!),
      backgroundColor: Colors.green,
    ));
    Navigator.pop(context);
  } else if (state.addressNewState == RequestStateCart.loadingState ||
      state.addressDeleteState == RequestStateCart.loadingState ||
      state.addressUpdateState == RequestStateCart.loadingState) {
    EasyLoading.show(
      status: "Loading.....".tr(context).toUpperCase(),
      maskType: EasyLoadingMaskType.black,
    );
  }
}
