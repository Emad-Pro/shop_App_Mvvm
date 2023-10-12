import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/core/get_it/service_locator.dart';
import 'package:shop_app_mvvm/core/widget/custom_loading.dart';

import 'package:shop_app_mvvm/feture/order/presentation/view/widget/BuildListViewOrderwidget.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view_model/bloc/order_bloc.dart';

import '../../../../core/enum.dart';
import '../../../../core/widget/custom_Erorr_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("orders".tr(context)),
      ),
      body: BlocProvider.value(
          value: OrderBloc(getIt())..add(GetOrderDataEvent()),
          child: BlocConsumer<OrderBloc, OrderState>(
            listener: (context, state) {
              if (state.cancelOrderState == RequestStateCart.loadedState) {
                EasyLoading.dismiss();
                BlocProvider.of<OrderBloc>(context).add(GetOrderDataEvent());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.cancelOrderModel!.message!)),
                );
              } else if (state.cancelOrderState == RequestStateCart.loadingState) {
                EasyLoading.show(
                  status: "Loading.....".tr(context),
                  maskType: EasyLoadingMaskType.black,
                );
              }
            },
            builder: (context, state) {
              switch (state.orderState) {
                case RequestState.loadingState:
                  return const LoadingWidget();
                case RequestState.loadedState:
                  return state.orderModel!.data!.data!.isEmpty
                      ? Center(child: Text("ordersIsEmpty".tr(context).toUpperCase()))
                      : CustomScrollView(
                          slivers: [
                            BuildListViewOrderwidget(
                              state: state,
                            )
                          ],
                        );
                case RequestState.erorrState:
                  return CustomErorrWidget(
                    erorrMessage: state.orderErorrMessage.tr(context),
                    onPressd: () {
                      BlocProvider.of<OrderBloc>(context).add(GetOrderDataEvent());
                    },
                  );
              }
            },
          )),
    );
  }
}
