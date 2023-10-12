import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_textFormFild.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view_model/cubit/login_cubit.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormFiled(
              formFieldController: emailTextEditingController,
              hintText: "email".tr(context),
              suffix: const Icon(Icons.email),
              validate: (value) {
                if (value!.isEmpty) {
                  return "enterEmail".tr(context);
                }

                return null;
              }),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormFiled(
              formFieldController: passwordTextEditingController,
              ispassword: BlocProvider.of<LoginCubit>(context).isPassword,
              hintText: "password".tr(context),
              suffix: IconButton(
                  onPressed: () {
                    BlocProvider.of<LoginCubit>(context).changeIsPasswordStatus();
                  },
                  icon: BlocProvider.of<LoginCubit>(context).isPassword
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.lock)),
              validate: (value) {
                if (value!.isEmpty) {
                  return "enterPassword".tr(context);
                }
                return null;
              }),
        ],
      ),
    );
  }
}
