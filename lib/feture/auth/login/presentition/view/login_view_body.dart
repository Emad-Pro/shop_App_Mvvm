import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/methods/snackBar.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view/widget/FormLoginWidget.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view/widget/ImageLoginWidget.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view/widget/LoginButtonWidget.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view/widget/OtherSelectionWidget.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view/widget/TitleLoginWidget.dart';

import '../../../../home/view/home.dart';

import '../view_model/cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);
  static final formKey = GlobalKey<FormState>();
  static final TextEditingController emailTextEditingController = TextEditingController();
  static final TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: listenerLoginApp,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageLoginWidget(),
                const TitleLoginWidget(),
                const SizedBox(
                  height: 40,
                ),
                FormLoginWidget(
                    formKey: formKey,
                    emailTextEditingController: emailTextEditingController,
                    passwordTextEditingController: passwordTextEditingController),
                const SizedBox(
                  height: 25,
                ),
                LoginButtonWidget(
                    formKey: formKey,
                    emailTextEditingController: emailTextEditingController,
                    passwordTextEditingController: passwordTextEditingController),
                const SizedBox(
                  height: 10,
                ),
                const OtherSelectionWidget(),
                const Center(
                    child: Text(
                  "This application was developed by ",
                  textAlign: TextAlign.center,
                )),
                const Center(
                  child: const Text(
                    " Emad Younis",
                    style: TextStyle(
                        color: Color.fromARGB(255, 13, 132, 230), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void listenerLoginApp(context, state) {
    if (state is LoginLoadingState) {
      EasyLoading.show(
        status: "Loading.....".tr(context),
        maskType: EasyLoadingMaskType.black,
      );
    }
    if (state is LoginErorrState) {
      EasyLoading.dismiss();
      snackBarCustomMethod(
          context: context,
          textMessage: "${"login".tr(context).toUpperCase()}:${state.erorrMassage}");
    }
    if (state is LoginLoadedState && state.loginModel.data != null) {
      EasyLoading.dismiss();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
