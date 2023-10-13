import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/blocObserver/blocObserver.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/get_it/service_locator.dart';
import 'package:shop_app_mvvm/core/shared_preferences/CacheHelper.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';

Future<void> mainStartApp() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await UserData.init();
  await DioHelper.init();
  await SettingApp.settingDarkModeInit();
  await PayMob.init();
  ServiceLocator().init();

  Bloc.observer = MyBlocObserver();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
