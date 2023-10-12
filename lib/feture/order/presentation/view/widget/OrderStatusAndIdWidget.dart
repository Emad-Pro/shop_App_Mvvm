import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

class OrderStatusAndIdWidget extends StatelessWidget {
  const OrderStatusAndIdWidget({super.key, required this.orderId, required this.orderStatus});
  final int orderId;
  final String orderStatus;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${"orderId".tr(context)} #'.toUpperCase(),
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.040)),
        Text("$orderId", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.040)),
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.008,
              right: MediaQuery.of(context).size.width * 0.008),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.020,
              vertical: MediaQuery.of(context).size.width * 0.005),
          decoration: BoxDecoration(
              color: orderStatus == 'جديد' || orderStatus == 'New'
                  ? Colors.green[100]
                  : Colors.red[100],
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Icon(
                orderStatus == 'جديد' || orderStatus == 'New' ? Icons.check_circle : Icons.cancel,
                color: orderStatus == 'جديد' || orderStatus == 'New'
                    ? const Color.fromARGB(255, 48, 172, 56)
                    : Color.fromARGB(255, 119, 46, 33),
              ),
              const SizedBox(
                width: 5,
              ),
              if (orderStatus == 'جديد' || orderStatus == 'New')
                Text(
                  "Order New",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 48, 172, 56),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                ),
              if (orderStatus == 'ملغي' || orderStatus == 'Cancelled')
                Text(
                  "orderCanceled".tr(context),
                  style: TextStyle(
                      color: const Color.fromARGB(255, 119, 46, 33),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
