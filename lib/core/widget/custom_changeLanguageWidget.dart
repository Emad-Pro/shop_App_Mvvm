import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view_model/cubit/setting_cubit.dart';

class CustomWidgetChangeLanguage extends StatelessWidget {
  const CustomWidgetChangeLanguage({super.key, required this.horizontalTitleGap});
  final double horizontalTitleGap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.titleHeight,
        horizontalTitleGap: horizontalTitleGap,
        title: DropdownButton<String>(
            isExpanded: true,
            isDense: false,
            value: BlocProvider.of<SettingCubit>(context).locale!.languageCode == "en"
                ? "English"
                : "Arabic",
            items: ["English", "Arabic"].map((String items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(items.tr(context)),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue == "English") {
                BlocProvider.of<SettingCubit>(context).changeLanguage("en");
              } else if (newValue == "Arabic") {
                BlocProvider.of<SettingCubit>(context).changeLanguage("ar");
              }
            }),
        leading: Text(
          "language".tr(context).toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 20 * MediaQuery.textScaleFactorOf(context)),
        ),
      ),
    );
  }
}
