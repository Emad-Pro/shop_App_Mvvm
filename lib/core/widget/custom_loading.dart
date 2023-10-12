import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                Text("Loading.....".tr(context)),
              ],
            )),
      ),
    );
  }
}
