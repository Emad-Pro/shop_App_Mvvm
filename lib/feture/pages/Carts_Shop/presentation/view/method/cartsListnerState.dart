import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import '../../../../../../core/enum.dart';
import '../../view_model/bloc/carts_bloc.dart';

void cartsListenerState(CartsState state, BuildContext context) {
  if (state.cartsUpdateQuantityProductState == RequestStateCart.loadedState ||
      state.cartModifiyState == RequestStateCart.loadedState) {
    BlocProvider.of<CartsBloc>(context).add(CartsGetDataEvent(false));
    if (state.cartsUpdateQuantityProductState == RequestStateCart.loadedState ||
        state.cartModifiyState == RequestStateCart.loadedState) {
      EasyLoading.dismiss(animation: true);
    }
  } else if (state.cartsUpdateQuantityProductState == RequestStateCart.loadingState ||
      state.cartModifiyState == RequestStateCart.loadingState) {
    EasyLoading.show(
      status: "Loading.....".tr(context),
      maskType: EasyLoadingMaskType.black,
    );
  }
}
