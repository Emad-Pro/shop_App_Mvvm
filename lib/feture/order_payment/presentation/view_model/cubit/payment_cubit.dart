import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_payment/paymob_payment.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import '../../../../pages/address/data/model/address_model/datum.dart';

import '../../view/widget/CompletedSelectionPaymentWidget.dart';

import '../../view/widget/Payment_Widget.dart';
import '../../view/widget/SteperSelectAddressListView.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState());

  static PaymentCubit get(context) => BlocProvider.of<PaymentCubit>(context);
  int currentStep = 0;
  bool isLastStep = false;
  int idAddress = 0;
  DataAddress? addressData;
  String paymentMethod = "cache";
  PaymobResponse? response;
  List<Step> getSteps(context) => [
        Step(
          isActive: currentStep >= 0,
          title: Text("Select Address".tr(context)),
          content: const SteperSelectAddressListView(),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text("Select Payment".tr(context)),
          content: const PaymentWidget(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text("Result Selected".tr(context)),
          content: const CompletedSelectionPayment(),
        ),
      ];

  void changeCurrentStep(String op) {
    if (op == '+') {
      currentStep += 1;

      emit(PaymentChangeCurrentStepPlusState());
    } else {
      currentStep -= 1;

      emit(PaymentChangeCurrentStepMinusState());
    }
  }

  void selectAddressChangeColor(int id, DataAddress dataAddressSelected) {
    addressData = dataAddressSelected;
    idAddress = id;
    emit(PaymentSelectAddressChangeColorState());
  }

  void changePaymentMethod(String method) {
    paymentMethod = method;
    emit(PaymentPaymentMethodChangeColorState());
  }

  void paymentPaymob(
      {required dynamic context, required String currency, required String amountInCents}) async {
    emit(PaymentPaymobLoading());
    PaymobPayment.instance
        .pay(
      context: context,
      currency: currency,
      amountInCents: amountInCents,
      billingData: PaymobBillingData(),
      onPayment: (response) {
        emit(PaymentPaymob(response: response));
      },
    )
        .then((value) {
      if (value!.success == false) {
        emit(PaymentPaymobCanceled(erorrMessage: "The payment process has been closed, try again"));
      }
    }).catchError((onError) {
      emit(PaymentPaymobCanceled(erorrMessage: "Some Erorr"));
    });
  }
}
