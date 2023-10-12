import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_Erorr_widget.dart';
import 'package:shop_app_mvvm/core/widget/custom_loading.dart';

import '../../../../../../../../../core/enum.dart';

import '../../view_model/bloc/address_bloc.dart';

import 'list_view_Address_widget.dart';

class ListViewAddress extends StatelessWidget {
  const ListViewAddress({Key? key, required this.addressState}) : super(key: key);
  final AddressState addressState;
  @override
  Widget build(BuildContext context) {
    switch (addressState.getAddressState) {
      case RequestState.loadingState:
        return const LoadingWidget();
      case RequestState.loadedState:
        return ListViewWidget(
          state: addressState,
        );
      case RequestState.erorrState:
        return CustomErorrWidget(
          erorrMessage: addressState.getAddressMessage.tr(context),
          onPressd: () {
            BlocProvider.of<AddressBloc>(context).add(const GetAddressEvent(isReload: true));
          },
        );
    }
  }
}
