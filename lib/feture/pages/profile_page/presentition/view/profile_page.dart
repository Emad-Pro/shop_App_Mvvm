import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/core/enum.dart';
import 'package:shop_app_mvvm/core/get_it/service_locator.dart';

import 'package:shop_app_mvvm/core/widget/custom_Erorr_widget.dart';

import 'package:shop_app_mvvm/core/widget/custom_textFormFild.dart';

import 'package:shop_app_mvvm/feture/pages/profile_page/presentition/view/widget/button_update_profile_widget.dart';

import '../view_model/profile/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameTextEditingController = TextEditingController();
    final TextEditingController emailTextEditingController = TextEditingController();
    final TextEditingController phoneTextEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile".tr(context)),
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(getIt())..add(ProfileUserDataEvent()),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state.profileUserModel != null) {
            nameTextEditingController.text = state.profileUserModel!.data!.name!;
            emailTextEditingController.text = state.profileUserModel!.data!.email!;
            phoneTextEditingController.text = state.profileUserModel!.data!.phone!;
          }
          switch (state.profileUserDataState) {
            case RequestState.loadingState:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loadedState:
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormFiled(
                            formFieldController: nameTextEditingController,
                            suffix: const Icon(Icons.person),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormFiled(
                            formFieldController: phoneTextEditingController,
                            suffix: const Icon(Icons.phone),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormFiled(
                            formFieldController: emailTextEditingController,
                            suffix: const Icon(Icons.email),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ButtonUpdateProfileWidget(
                              nameTextEditingController: nameTextEditingController,
                              emailTextEditingController: emailTextEditingController,
                              phoneTextEditingController: phoneTextEditingController,
                              state: state),
                        ],
                      ),
                    ),
                  )
                ],
              );
            case RequestState.erorrState:
              return CustomErorrWidget(
                erorrMessage: state.profileUserDataMessage.tr(context),
                onPressd: () {
                  BlocProvider.of<ProfileBloc>(context).add(ProfileUserDataEvent());
                },
              );
          }
        }),
      ),
    );
  }
}
