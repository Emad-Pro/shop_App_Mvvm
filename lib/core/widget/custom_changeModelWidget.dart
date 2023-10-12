import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view_model/cubit/setting_cubit.dart';

class CustomWidgetChangeDarkMode extends StatelessWidget {
  const CustomWidgetChangeDarkMode({super.key, required this.horizontalTitleGap});
  final double horizontalTitleGap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: FlutterSwitch(
            value: SettingApp.darkMode,
            padding: 5,
            onToggle: (value) {
              BlocProvider.of<SettingCubit>(context).getDarkMode();
            }),
        horizontalTitleGap: horizontalTitleGap,
        leading: Text(
          "darkMode".tr(context).toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 20 * MediaQuery.textScaleFactorOf(context)),
        ),
      ),
    );
  }
}
