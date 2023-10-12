import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/auth/singup/data/model/sign_up_model/data.dart';
import 'package:shop_app_mvvm/feture/auth/singup/presentation/view_model/cubit/sign_up_cubit.dart';

import '../../../../../core/asset/assets_text.dart';

import '../../../../../core/get_it/service_locator.dart';
import '../../../../../core/methods/snackBar.dart';

import '../../../../../core/widget/custom_buttom.dart';
import '../../../../../core/widget/custom_textFormFild.dart';

// ignore: must_be_immutable
class SinUpView extends StatelessWidget {
  SinUpView({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController? emailTextEditingController = TextEditingController();
    TextEditingController? passwordTextEditingController = TextEditingController();
    TextEditingController? nameTextEditingController = TextEditingController();
    TextEditingController? phoneTextEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("signUp".tr(context)),
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt()),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpAccountLoadedState) {
              if (state.signUpModel.status == false) {
                snackBarCustomMethod(
                    context: context,
                    textMessage: state.signUpModel.message!,
                    backgroundColor: Colors.orange);
              } else {
                snackBarCustomMethod(
                  context: context,
                  textMessage: state.signUpModel.message!,
                  backgroundColor: Colors.deepOrangeAccent,
                );
                Navigator.pop(context);
              }
            }
            if (state is SignUpAccountErorrState) {
              snackBarCustomMethod(
                  context: context, textMessage: state.erorrMessage, backgroundColor: Colors.red);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        alignment: Alignment.center,
                        image: const AssetImage(AssetsString.loginImage),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextFormFiled(
                              formFieldController: nameTextEditingController,
                              hintText: "yourName".tr(context).toUpperCase(),
                              suffix: const Icon(IconBroken.Profile),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "enterYourName".tr(context).toUpperCase();
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormFiled(
                              formFieldController: emailTextEditingController,
                              hintText: "email".tr(context).toUpperCase(),
                              suffix: const Icon(IconBroken.Message),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "enterEmail".tr(context).toUpperCase();
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormFiled(
                              formFieldController: phoneTextEditingController,
                              hintText: "phoneNumber".tr(context).toUpperCase(),
                              suffix: const Icon(IconBroken.Call),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "enterYourName".tr(context).toUpperCase();
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormFiled(
                              formFieldController: passwordTextEditingController,
                              hintText: "password".tr(context).toUpperCase(),
                              ispassword: BlocProvider.of<SignUpCubit>(context).isPassword,
                              suffix: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<SignUpCubit>(context).showHidePassword();
                                  },
                                  icon: BlocProvider.of<SignUpCubit>(context).isPassword!
                                      ? Icon(IconBroken.Lock)
                                      : Icon(Icons.remove_red_eye_outlined)),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "enterPassword".tr(context).toUpperCase();
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          state is SignUpAccountLoadingState
                              ? CircularProgressIndicator()
                              : CustomButtom(
                                  color: Colors.deepOrangeAccent,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height * 0.04,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<SignUpCubit>(context).fetchSignUpAccount(
                                          dataSignUp: DataSignUp(
                                              name: nameTextEditingController.text,
                                              email: emailTextEditingController.text,
                                              phone: phoneTextEditingController.text,
                                              password: passwordTextEditingController.text));
                                    }
                                  },
                                  widget: Text(
                                    "singUp".tr(context).toUpperCase(),
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width * 0.05),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
