import 'package:flutter/material.dart';

class OrderDetailsAddressDetailsWidget extends StatelessWidget {
  const OrderDetailsAddressDetailsWidget(
      {super.key, required this.textTitle, required this.textValue});
  final String textTitle;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        children: [
          Text(
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
            textTitle,
            maxLines: 1,
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
              textValue.toString(),
              textAlign: TextAlign.right,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
