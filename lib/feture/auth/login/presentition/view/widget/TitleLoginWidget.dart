import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

class TitleLoginWidget extends StatelessWidget {
  const TitleLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "shopApp".tr(context).toUpperCase(),
      style: const TextStyle(fontSize: 30),
    );
  }
}
