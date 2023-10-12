import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/order/data/model/order_model/datum.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view_model/bloc/order_bloc.dart';

class BuildListViewItemOrderWidget extends StatelessWidget {
  const BuildListViewItemOrderWidget({
    super.key,
    required this.data,
    required this.state,
  });
  final OrderState state;
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${"productstatus".tr(context).toUpperCase()} : ",
                      style: const TextStyle(fontSize: 17),
                    ),
                    Text(data.status!, style: const TextStyle(fontSize: 17)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("${"orderDate".tr(context).toUpperCase()} : ",
                        style: TextStyle(fontSize: 17)),
                    Text(data.date!, style: const TextStyle(fontSize: 17)),
                  ],
                ),
              ],
            ),
            Spacer(),
            if (data.status == 'جديد' || data.status == 'New')
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<OrderBloc>(context).add(CancelOrderEvent(data.id!));
                  },
                  child: Text("cancelOrder".tr(context))),
          ],
        ),
      ),
    );
  }
}
