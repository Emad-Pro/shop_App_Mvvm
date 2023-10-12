import 'package:flutter/material.dart';

import '../../view_model/bloc/carts_bloc.dart';

import 'BuildCartsListViewItem.dart';

class CustomGridViewCartWidget extends StatelessWidget {
  const CustomGridViewCartWidget({
    super.key,
    required this.state,
  });
  final CartsState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.cartsModel!.data!.cartItems!.length,
        itemBuilder: (context, index) {
          final productItem = state.cartsModel!.data!.cartItems![index];
          return BuildCartsListViewItem(productItem: productItem, state: state);
        });
  }
}
