import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_changeLanguageWidget.dart';
import 'package:shop_app_mvvm/core/widget/custom_changeModelWidget.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view_model/cubit/setting_cubit.dart';

class BuildDrawerWidget extends StatelessWidget {
  const BuildDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return Column(
            children: [
              DrawerHeader(
                child: Center(
                    child: Text(
                  "settings".tr(context),
                  style: TextStyle(fontSize: 25),
                )),
              ),
              const Divider(
                height: 0.01,
                color: Colors.grey,
              ),
              CustomWidgetChangeLanguage(
                horizontalTitleGap: MediaQuery.of(context).size.width * 0.13,
              ),
              CustomWidgetChangeDarkMode(
                horizontalTitleGap: MediaQuery.of(context).size.width * 0.19,
              ),
              const Spacer(),
              const SizedBox(
                height: 10,
              ),
              const Center(
                  child: Text(
                "This application was developed by ",
                textAlign: TextAlign.center,
              )),
              const Text(
                " Emad Younis",
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 132, 230), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
