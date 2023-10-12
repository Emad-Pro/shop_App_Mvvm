import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import '../../../../../order_payment/presentation/view/StepperPayment.dart';
import '../../../data/model/cart_model/carts_model/carts_model.dart';

class ChackOutButtonWidget extends StatelessWidget {
  const ChackOutButtonWidget({Key? key, required this.cartsModel}) : super(key: key);
  final CartsModel cartsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            Column(
              children: [
                Row(children: [
                  Text(
                    "count".tr(context).toUpperCase(),
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                  ),
                  const Spacer(),
                  Text(cartsModel.data!.cartItems!.length.toString(),
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                ]),
                Row(
                  children: [
                    Text(
                      "total".tr(context).toUpperCase(),
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                    const Spacer(),
                    Text(cartsModel.data!.total.toString(),
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "subTotal".tr(context).toUpperCase(),
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                    const Spacer(),
                    Text(cartsModel.data!.subTotal.toString(),
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const StepperApp()));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith((states) {
                    return const RoundedRectangleBorder();
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (Theme.of(context).brightness == Brightness.light) {
                        return Colors.deepOrangeAccent;
                      } else {
                        return Colors.deepOrangeAccent;
                      }
                    },
                  ),
                ),
                child: Text(
                  'chackOut'.tr(context),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
