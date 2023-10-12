import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

void snackBarCustomMethod(
    {required BuildContext context,
    required String textMessage,
    Color? backgroundColor,
    Color? actionColor}) {
  final snackBar = SnackBar(
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: 10),
    dismissDirection: DismissDirection.down,
    content: Text(textMessage),
    action: SnackBarAction(
      backgroundColor: actionColor,
      label: 'close'.tr(context),
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
