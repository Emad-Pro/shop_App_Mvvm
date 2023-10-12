import 'package:flutter/material.dart';

import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/core/widget/BuildDrawerWidget.dart';

import 'login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("loginShop".tr(context).toUpperCase()),
      ),
      body: const LoginViewBody(),
      drawer: const BuildDrawerWidget(),
    );
  }
}
