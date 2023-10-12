import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/lists/list_blocProvider.dart';
import 'package:shop_app_mvvm/core/methods/main_startApp.dart';
import 'package:shop_app_mvvm/feture/main_view_body.dart';

void main() async {
  await mainStartApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: const MaterialAppWidget(),
    );
  }
}
