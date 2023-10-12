import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import '../../view_model/cubit/payment_cubit.dart';

class PaymentVisaWidget extends StatelessWidget {
  const PaymentVisaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            PaymentCubit.get(context).changePaymentMethod("visa");
          },
          child: Card(
            color:
                PaymentCubit.get(context).paymentMethod == "visa" ? Colors.deepOrangeAccent : null,
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Image(image: AssetImage("assets/payment_Image/5615659.png"))),
                Text(
                  "visa".tr(context).toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
