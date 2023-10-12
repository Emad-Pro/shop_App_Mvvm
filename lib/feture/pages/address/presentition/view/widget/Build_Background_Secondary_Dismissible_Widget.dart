import 'package:flutter/material.dart';

class BuildBackgroundSecondaryDismissibleWidget extends StatelessWidget {
  const BuildBackgroundSecondaryDismissibleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.edit,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
