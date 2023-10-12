import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/leistener.dart';
import 'package:shop_app_mvvm/core/widget/custom_loading.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view/widget/add_address_Button_widget.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view/widget/listView_address_item.dart';
import '../../../../../core/enum.dart';
import '../../../../../core/widget/custom_Erorr_widget.dart';

import '../view_model/bloc/address_bloc.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressBloc, AddressState>(
      listener: coustomListenerAddress,
      builder: (context, state) {
        switch (state.getAddressState) {
          case RequestState.loadingState:
            return const LoadingWidget();
          case RequestState.loadedState:
            return CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                if (state.getAddressModel!.data!.data!.isNotEmpty)
                  SliverFillRemaining(
                      child: Column(
                    children: [
                      Expanded(
                          child: ListViewAddress(
                        addressState: state,
                      )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const AddAddressButtonWidget())
                    ],
                  )),
                if (state.getAddressModel!.data!.data!.isEmpty)
                  SliverFillRemaining(
                      child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Center(
                        child: Text("TheAddressisEmpty".tr(context).toUpperCase()),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const AddAddressButtonWidget()),
                    ],
                  ))
              ],
            );

          case RequestState.erorrState:
            return CustomErorrWidget(
              erorrMessage: state.getAddressMessage.tr(context),
              onPressd: () {
                BlocProvider.of<AddressBloc>(context).add(const GetAddressEvent(isReload: true));
              },
            );
        }
      },
    );
  }
}
