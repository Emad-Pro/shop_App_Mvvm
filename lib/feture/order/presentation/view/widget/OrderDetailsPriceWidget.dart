import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/OrderDetailsPriceValueWidget.dart';

import 'package:shop_app_mvvm/feture/order/presentation/view_model/bloc/order_bloc.dart';

class OrderDetailsPriceWidget extends StatelessWidget {
  const OrderDetailsPriceWidget({Key? key, required this.state}) : super(key: key);
  final OrderState state;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021),
        child: Column(children: [
          Text(
            "${state.orderDetailsModel!.data!.total.round().toString()} ${"EGP".tr(context)}",
            style: TextStyle(
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent),
          ),
          Text(
            "totalPrice".tr(context).toUpperCase(),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5,
                color: Colors.deepOrangeAccent),
          ),
          const Divider(),
          Container(
            //  color: Colors.white,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.010),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.010,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: 15),
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OrderDetailsPriceValueWidget(
                  textTitle: "discount".tr(context).toUpperCase(),
                  textValue: state.orderDetailsModel!.data!.discount.round().toString(),
                ),
                OrderDetailsPriceValueWidget(
                  textTitle: "points".tr(context).toUpperCase(),
                  textValue: state.orderDetailsModel!.data!.points.round().toString(),
                ),
                OrderDetailsPriceValueWidget(
                  textTitle: "valueAddedTax".tr(context).toUpperCase(),
                  textValue: state.orderDetailsModel!.data!.vat.round().toString(),
                ),
                OrderDetailsPriceValueWidget(
                  textTitle: "costProduct".tr(context).toUpperCase(),
                  textValue: state.orderDetailsModel!.data!.cost!.round().toString(),
                ),
                OrderDetailsPriceValueWidget(
                  textTitle: "paymentMethod".tr(context).toUpperCase(),
                  textValue: state.orderDetailsModel!.data!.paymentMethod!,
                ),
                const DottedLine(
                  dashColor: Color.fromARGB(255, 196, 195, 195),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    Jiffy.parse('${state.orderDetailsModel!.data!.date}', pattern: 'dd / M / yyyy')
                        .format(pattern: 'EEE,MMMM d, yyyy'),
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
