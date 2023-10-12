import 'package:flutter/material.dart';

import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

class CustomErorrWidget extends StatelessWidget {
  const CustomErorrWidget({Key? key, required this.erorrMessage, required this.onPressd})
      : super(key: key);
  final String erorrMessage;
  final VoidCallback onPressd;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage("assets/erorrImage/3814247.png"),
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  erorrMessage.toUpperCase(),
                  style: const TextStyle(letterSpacing: 2),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: onPressd,
                  child: Text("tryAgain".tr(context).toString()),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
