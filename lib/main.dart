import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shop_app_mvvm/core/shared_preferences/CacheHelper.dart';
import 'package:shop_app_mvvm/core/get_it/service_locator.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';
import 'package:shop_app_mvvm/feture/onBoarding/view/onBoarding_view.dart';
import 'package:shop_app_mvvm/feture/onBoarding/view_model/cubit/on_boarding_cubit.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view_model/cubit/setting_cubit.dart';

import 'core/AppLocalizations/app_localizations.dart';
import 'core/blocObserver/blocObserver.dart';
import 'core/dio/dio_helper.dart';

import 'feture/auth/login/presentition/view_model/cubit/login_cubit.dart';
import 'feture/auth/logout/presentition/view_model/cubit/log_out_cubit.dart';

void main() async {
  await mainStartApp();
  await SettingApp.settingDarkModeInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnBoardingCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(getIt()),
          ),
          BlocProvider(
            create: (context) => LogOutCubit(getIt()),
          ),
          BlocProvider(
            create: (context) => SettingCubit(getIt())..getSavedLanguage(),
          ),
        ],
        child: BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
          return MaterialApp(
            locale: BlocProvider.of<SettingCubit>(context).locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'shopApp',
            themeMode: SettingApp.darkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkTheme(),
            theme: lightTheme(),
            home: UserData.homewidget(),
          );
        }));
  }

  ThemeData lightTheme() => ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrangeAccent,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange, brightness: Brightness.light),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
        ),
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(fontFamily: "rubik-Light"),
      );

  ThemeData darkTheme() => ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.deepOrangeAccent,
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange, brightness: Brightness.dark),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
      ),
      useMaterial3: true,
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: "rubik-Light"));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> mainStartApp() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await UserData.init();
  await DioHelper.init();
  await PayMob.init();
  ServiceLocator().init();

  Bloc.observer = MyBlocObserver();
}
