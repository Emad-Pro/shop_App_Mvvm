import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/enum.dart';
import 'package:shop_app_mvvm/core/get_it/service_locator.dart';
import 'package:shop_app_mvvm/core/widget/custom_Erorr_widget.dart';
import 'package:shop_app_mvvm/core/widget/custom_loading.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/OrderDetailsAddressWidget.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/OrderDetailsPriceWidget.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/OrderDetailsProductListView.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/OrderStatusAndIdWidget.dart';

import 'package:shop_app_mvvm/feture/order/presentation/view_model/bloc/order_bloc.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key, required this.orderId}) : super(key: key);
  final int orderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("orderDetails".tr(context)),
      ),
      body: BlocProvider(
        create: (context) => OrderBloc(getIt())..add(GetOrderDetailsEvent(orderId)),
        child: BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
          switch (state.orderDetailsState) {
            case RequestState.loadingState:
              return const LoadingWidget();
            case RequestState.loadedState:
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: OrderStatusAndIdWidget(
                        orderId: orderId,
                        orderStatus: state.orderDetailsModel!.data!.status!,
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Divider(
                      color: Colors.grey[300],
                    )),
                    SliverToBoxAdapter(
                        child: OrderDetailsPriceWidget(
                      state: state,
                    )),
                    SliverToBoxAdapter(
                        child: OrderDetailsAddressWidget(
                      state: state,
                    )),
                    SliverToBoxAdapter(
                        child: OrderDetailsProductListView(
                      products: state.orderDetailsModel!.data!.products,
                    ))
                  ],
                ),
              );
            case RequestState.erorrState:
              return CustomErorrWidget(
                erorrMessage: state.orderDetailsErorrMessage.tr(context),
                onPressd: () {
                  BlocProvider.of<OrderBloc>(context).add(GetOrderDetailsEvent(orderId));
                },
              );
          }
        }),
      ),
    );
  }
}
