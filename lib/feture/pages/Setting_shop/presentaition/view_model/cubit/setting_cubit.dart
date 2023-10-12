import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/language_cache/language_cache.dart';
import '../../../../../../core/shared_preferences/CacheHelper.dart';
import '../../../../../../core/user_data/uId.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  Locale? locale = Locale("en");

  SettingCubit(this.languageCacheHelper) : super(const SettingState());
  final LanguageCacheHelper languageCacheHelper;
  Future getDarkMode() async {
    SettingApp.darkMode = !SettingApp.darkMode;
    await CacheHelper.saveData(key: "darkMode", value: SettingApp.darkMode).then((value) {
      emit(SettingDarkMode());
    }).catchError((onError) {});
  }

  Future<void> getSavedLanguage() async {
    final String cacheLanguageCode = await languageCacheHelper.getCacheLanguageCode();
    locale = Locale(cacheLanguageCode);
    emit(ChangeLocaleState(locale: Locale(cacheLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await languageCacheHelper.setCacheLanguageCode(languageCode).then((value) {});
    locale = Locale(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
