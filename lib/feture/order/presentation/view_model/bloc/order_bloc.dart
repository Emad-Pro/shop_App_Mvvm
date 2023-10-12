import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/feture/order/data/model/order_create_model/order_create_model.dart';
import 'package:shop_app_mvvm/feture/order/data/repository/order_repository.dart';

import '../../../../../core/enum.dart';
import '../../../data/model/order_cancel_model/order_cancel_model.dart';
import '../../../data/model/order_details_model/order_details_model.dart';
import '../../../data/model/order_model/order_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.orderRepository) : super(OrderState()) {
    on<GetOrderDataEvent>(_getOrderData);
    on<GetOrderDetailsEvent>(_getOrderDetails);
    on<CreateOrderNewEvent>(_createNewOrder);
    on<CancelOrderEvent>(_cancelOrderMethod);
  }
  final OrderRepository orderRepository;
  FutureOr<void> _getOrderData(GetOrderDataEvent event, Emitter<OrderState> emit) async {
    await orderRepository.fetchOrderData().then((value) {
      value.fold(
          (l) => emit(state.copyWith(
              orderErorrMessage: l.erorrMessage,
              orderState: RequestState.erorrState,
              cancelOrderState: RequestStateCart.normalState)),
          (r) => emit(state.copyWith(
              orderModel: r,
              orderState: RequestState.loadedState,
              cancelOrderState: RequestStateCart.normalState)));
    });
  }

  FutureOr<void> _getOrderDetails(GetOrderDetailsEvent event, Emitter<OrderState> emit) async {
    await orderRepository.fetchOrderDetails(orderId: event.id).then((value) {
      value.fold(
          (l) => emit(state.copyWith(
                orderDetailsState: RequestState.erorrState,
                orderDetailsErorrMessage: l.erorrMessage,
                cancelOrderState: RequestStateCart.normalState,
              )),
          (r) => emit(state.copyWith(
              orderDetailsModel: r,
              orderDetailsState: RequestState.loadedState,
              cancelOrderState: RequestStateCart.normalState)));
    });
  }

  FutureOr<void> _createNewOrder(CreateOrderNewEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(
        orderCreateState: RequestState.loadingState,
        cancelOrderState: RequestStateCart.normalState));
    await orderRepository.fetchOrderCreate(orderData: event.data).then((value) {
      value.fold((l) {
        emit(state.copyWith(
            orderCreateState: RequestState.erorrState,
            orderCreateMeassge: l.erorrMessage,
            cancelOrderState: RequestStateCart.normalState));
      },
          (r) => emit(state.copyWith(
              orderCreateModel: r,
              orderCreateState: RequestState.loadedState,
              cancelOrderState: RequestStateCart.normalState)));
    });
  }

  FutureOr<void> _cancelOrderMethod(CancelOrderEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(cancelOrderState: RequestStateCart.loadingState));
    await orderRepository.fetchCancelOrder(id: event.id).then((value) {
      value.fold(
          (l) => emit(state.copyWith(
              cancelOrderState: RequestStateCart.erorrState, cancelOrderMeassge: l.erorrMessage)),
          (r) => emit(
              state.copyWith(cancelOrderModel: r, cancelOrderState: RequestStateCart.loadedState)));
    });
  }
}
