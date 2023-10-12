import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/feture/pages/Carts_Shop/presentation/view/widget/ChackOutButtonWidget.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/presentation/view/widget/CustomGridViewCartWidget.dart';

import '../view_model/bloc/carts_bloc.dart';

class CartsViewBody extends StatelessWidget {
  const CartsViewBody({super.key, required this.state});
  final CartsState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              if (state.cartsModel!.data!.cartItems!.isNotEmpty)
                SliverToBoxAdapter(
                  child: CustomGridViewCartWidget(
                    state: state,
                  ),
                ),
              if (state.cartsModel!.data!.cartItems!.isEmpty)
                SliverFillRemaining(
                    child: Center(child: Text("cartIsEmpty".tr(context).toUpperCase())))
            ],
          ),
        ),
        if (state.cartsModel!.data!.cartItems!.isNotEmpty)
          ChackOutButtonWidget(
            cartsModel: state.cartsModel!,
          )
      ],
    );
  }
}
