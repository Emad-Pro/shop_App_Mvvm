import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enum.dart';
import '../../../../../../core/widget/custom_buttom.dart';
import '../../../../../auth/login/presentition/view/login_view.dart';
import '../../../../../auth/logout/presentition/view_model/cubit/log_out_cubit.dart';
import '../../../../profile_page/data/model/update_profile_model/update_profile_model.dart';
import '../../view_model/profile/bloc/profile_bloc.dart';

class ButtonUpdateProfileWidget extends StatelessWidget {
  const ButtonUpdateProfileWidget(
      {Key? key,
      required this.nameTextEditingController,
      required this.emailTextEditingController,
      required this.phoneTextEditingController,
      required this.state})
      : super(key: key);
  final ProfileState state;
  final TextEditingController nameTextEditingController;
  final TextEditingController emailTextEditingController;
  final TextEditingController phoneTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.profileUserUpdateDataState == RequestState.loadedState)
          CustomButtom(
            widget: const Text("Update"),
            color: Colors.deepOrangeAccent,
            onPressed: () async {
              BlocProvider.of<ProfileBloc>(context).add(
                ProfileUserUpdateEvent(
                  UpdateProfileModel(
                      name: nameTextEditingController.text,
                      email: emailTextEditingController.text,
                      phone: phoneTextEditingController.text),
                ),
              );
            },
          ),
        if (state.profileUserUpdateDataState == RequestState.loadingState)
          const Center(child: CircularProgressIndicator()),
        const SizedBox(
          width: 15,
        ),
        BlocBuilder<LogOutCubit, LogOutState>(
          builder: (context, state) {
            if (state is LogOutLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomButtom(
                widget: const Text("LogOut"),
                color: Colors.red,
                onPressed: () {
                  BlocProvider.of<LogOutCubit>(context).logoutUser().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => const LoginView()));
                  });
                },
              );
            }
          },
        ),
      ],
    );
  }
}
