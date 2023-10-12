import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/feture/order/presentation/view/widget/OrderDetailsAddressDetailsWidget.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view_model/bloc/order_bloc.dart';

class OrderDetailsAddressWidget extends StatelessWidget {
  const OrderDetailsAddressWidget({
    Key? key,
    required this.state,
  }) : super(key: key);
  final OrderState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetailsAddressDetailsWidget(
                textTitle: "nameAddress".tr(context).toUpperCase(),
                textValue: state.orderDetailsModel!.data!.address!.name!,
              ),
              OrderDetailsAddressDetailsWidget(
                textTitle: "city".tr(context).toUpperCase(),
                textValue: state.orderDetailsModel!.data!.address!.city!,
              ),
              OrderDetailsAddressDetailsWidget(
                textTitle: "region".tr(context).toUpperCase(),
                textValue: state.orderDetailsModel!.data!.address!.region!,
              ),
              OrderDetailsAddressDetailsWidget(
                textTitle: "details".tr(context).toUpperCase(),
                textValue: state.orderDetailsModel!.data!.address!.details!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
