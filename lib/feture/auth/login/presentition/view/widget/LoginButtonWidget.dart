import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_buttom.dart';
import 'package:shop_app_mvvm/feture/auth/login/data/model/data_login.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view_model/cubit/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.emailTextEditingController,
    required this.passwordTextEditingController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailTextEditingController;
  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButtom(
        color: Colors.deepOrangeAccent,
        width: MediaQuery.of(context).size.width * 0.8,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<LoginCubit>(context).fetchLoginUser(
                dataLogin: DataLogin(
                    email: emailTextEditingController.text,
                    password: passwordTextEditingController.text));
          }
        },
        widget: Text(
          "login".tr(context).toUpperCase(),
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
