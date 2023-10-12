part of 'setting_cubit.dart';

class SettingState {
  const SettingState();
}

class SettingDarkMode extends SettingState {
  SettingDarkMode();
}

class ChangeLocaleState extends SettingState {
  final Locale locale;

  ChangeLocaleState({required this.locale});
}
