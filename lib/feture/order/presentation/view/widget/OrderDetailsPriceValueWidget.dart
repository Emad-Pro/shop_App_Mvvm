import 'package:flutter/material.dart';

class OrderDetailsPriceValueWidget extends StatelessWidget {
  const OrderDetailsPriceValueWidget({Key? key, required this.textTitle, required this.textValue})
      : super(key: key);
  final String textTitle;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.010),
      child: Row(
        children: [
          Text(
            textTitle,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.040,
            ),
          ),
          const Spacer(),
          Text(
            textValue,
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.040),
          ),
        ],
      ),
    );
  }
}
