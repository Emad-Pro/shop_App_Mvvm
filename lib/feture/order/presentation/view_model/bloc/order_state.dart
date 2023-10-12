part of 'order_bloc.dart';

class OrderState extends Equatable {
  final OrderModel? orderModel;
  final RequestState orderState;
  final String orderErorrMessage;
  final OrderDetailsModel? orderDetailsModel;
  final RequestState orderDetailsState;
  final String orderDetailsErorrMessage;
  final OrderCreateModel? orderCreateModel;
  final RequestState? orderCreateState;
  final String orderCreateMeassge;
  final CancelOrderModel? cancelOrderModel;
  final RequestStateCart cancelOrderState;
  final String cancelOrderMeassge;
  const OrderState({
    this.orderModel,
    this.orderState = RequestState.loadingState,
    this.orderErorrMessage = '',
    this.orderDetailsModel,
    this.orderDetailsState = RequestState.loadingState,
    this.orderDetailsErorrMessage = '',
    this.orderCreateModel,
    this.orderCreateState,
    this.orderCreateMeassge = '',
    this.cancelOrderModel,
    this.cancelOrderState = RequestStateCart.normalState,
    this.cancelOrderMeassge = '',
  });
  OrderState copyWith({
    OrderModel? orderModel,
    RequestState? orderState,
    String? orderErorrMessage,
    OrderDetailsModel? orderDetailsModel,
    RequestState? orderDetailsState,
    String? orderDetailsErorrMessage,
    OrderCreateModel? orderCreateModel,
    RequestState? orderCreateState,
    String? orderCreateMeassge,
    CancelOrderModel? cancelOrderModel,
    RequestStateCart? cancelOrderState,
    String? cancelOrderMeassge,
  }) {
    return OrderState(
      orderModel: orderModel ?? this.orderModel,
      orderErorrMessage: orderErorrMessage ?? this.orderErorrMessage,
      orderState: orderState ?? this.orderState,
      orderDetailsModel: orderDetailsModel ?? this.orderDetailsModel,
      orderDetailsState: orderDetailsState ?? this.orderDetailsState,
      orderDetailsErorrMessage: orderDetailsErorrMessage ?? this.orderDetailsErorrMessage,
      orderCreateModel: orderCreateModel ?? this.orderCreateModel,
      orderCreateState: orderCreateState ?? this.orderCreateState,
      orderCreateMeassge: orderCreateMeassge ?? this.orderCreateMeassge,
      cancelOrderModel: cancelOrderModel ?? this.cancelOrderModel,
      cancelOrderState: cancelOrderState ?? this.cancelOrderState,
      cancelOrderMeassge: cancelOrderMeassge ?? this.cancelOrderMeassge,
    );
  }

  @override
  List<Object?> get props => [
        orderModel,
        orderErorrMessage,
        orderState,
        orderDetailsModel,
        orderDetailsState,
        orderDetailsErorrMessage,
        orderCreateModel,
        orderCreateState,
        orderCreateMeassge,
        cancelOrderModel,
        cancelOrderState,
        cancelOrderMeassge,
      ];
}
