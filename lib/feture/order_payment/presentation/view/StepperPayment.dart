import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import '../view_model/cubit/payment_cubit.dart';

class StepperApp extends StatelessWidget {
  const StepperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stepper(
            currentStep: BlocProvider.of<PaymentCubit>(context).currentStep,
            steps: BlocProvider.of<PaymentCubit>(context).getSteps(context),
            type: StepperType.vertical,
            controlsBuilder: (context, details) {
              final isLast = PaymentCubit.get(context).isLastStep =
                  PaymentCubit.get(context).currentStep ==
                      PaymentCubit.get(context).getSteps(context).length - 1;
              return Row(children: [
                if (!isLast)
                  Expanded(
                      child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 16, 90, 150),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(25), topStart: Radius.circular(25)))),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_rounded,
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.white
                                : Colors.white),
                        Spacer(),
                        Text(
                          "next".tr(context).toUpperCase(),
                          style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.white),
                        ),
                      ],
                    ),
                  )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: details.onStepCancel,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 104, 4, 4),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(25), bottomEnd: Radius.circular(25)))),
                  child: Row(
                    children: [
                      Text(
                        "forward".tr(context).toUpperCase(),
                        style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.white
                                : Colors.white),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.white,
                      ),
                    ],
                  ),
                ))
              ]);
            },
            onStepContinue: () {
              PaymentCubit.get(context).isLastStep = PaymentCubit.get(context).currentStep ==
                  PaymentCubit.get(context).getSteps(context).length - 1;
              if (PaymentCubit.get(context).currentStep == 0) {}
              if (PaymentCubit.get(context).isLastStep) {
              } else {
                if (PaymentCubit.get(context).idAddress != 0) {
                  BlocProvider.of<PaymentCubit>(context).changeCurrentStep('+');
                } else {
                  final snackBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.none,
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .09),
                    content: Text('chooseYourAddressFirst'.tr(context).toUpperCase()),
                    action: SnackBarAction(
                      label: 'close'.tr(context).toUpperCase(),
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
            onStepCancel: () {
              if (PaymentCubit.get(context).currentStep > 0) {
                BlocProvider.of<PaymentCubit>(context).changeCurrentStep('-');
              } else {
                Navigator.of(context).pop();
              }
            },
          );
        },
      ),
    ));
  }
}
