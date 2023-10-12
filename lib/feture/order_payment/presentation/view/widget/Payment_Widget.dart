import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'PaymentCacheWidget.dart';
import 'PaymentVisaWidget.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Center(
            child: Text(
              "selectPaymentMethod".tr(context),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Column(
            children: [
              PaymentCacheWidget(),
              PaymentVisaWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
