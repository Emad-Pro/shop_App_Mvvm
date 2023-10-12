import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/get_it/service_locator.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view_model/cubit/login_cubit.dart';
import 'package:shop_app_mvvm/feture/auth/logout/presentition/view_model/cubit/log_out_cubit.dart';
import 'package:shop_app_mvvm/feture/onBoarding/view_model/cubit/on_boarding_cubit.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view_model/cubit/setting_cubit.dart';

List<BlocProvider> providers = [
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
];
