part of 'payment_cubit.dart';

class PaymentState {
  const PaymentState();
}

class PaymentChangeCurrentStepPlusState extends PaymentState {}

class PaymentChangeCurrentStepMinusState extends PaymentState {}

class PaymentSelectAddressChangeColorState extends PaymentState {}

class PaymentPaymentMethodChangeColorState extends PaymentState {}

class PaymentPaymobLoading extends PaymentState {}

class PaymentPaymob extends PaymentState {
  final PaymobResponse response;
  PaymentPaymob({required this.response});
}

class PaymentPaymobCanceled extends PaymentState {
  final String erorrMessage;

  PaymentPaymobCanceled({required this.erorrMessage});
}
