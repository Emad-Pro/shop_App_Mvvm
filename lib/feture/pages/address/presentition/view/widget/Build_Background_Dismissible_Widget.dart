import 'package:flutter/material.dart';

class BuildBackgroundDismissibleWidget extends StatelessWidget {
  const BuildBackgroundDismissibleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.delete,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
