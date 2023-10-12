import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/BuildListViewItemOrderWidget.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/OrderDetailsScreen.dart';

import 'package:shop_app_mvvm/feture/order/presentation/view_model/bloc/order_bloc.dart';

class BuildListViewOrderwidget extends StatelessWidget {
  const BuildListViewOrderwidget({super.key, required this.state});
  final OrderState state;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: ListView.builder(
        itemCount: state.orderModel!.data!.data!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OrderDetailsScreen(orderId: state.orderModel!.data!.data![index].id!)));
            },
            child: BuildListViewItemOrderWidget(
                data: state.orderModel!.data!.data![index], state: state),
          );
        },
      ),
    );
  }
}
