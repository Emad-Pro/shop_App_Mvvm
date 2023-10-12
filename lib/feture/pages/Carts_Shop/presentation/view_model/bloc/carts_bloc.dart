import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/data/repository/carts_repository.dart';

import '../../../../../../core/enum.dart';
import '../../../../Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';
import '../../../data/model/cart_add_model/cart_add_model.dart';
import '../../../data/model/cart_model/carts_model/carts_model.dart';
import '../../../data/model/quantity_Product_model/quantity_product.dart';

part 'carts_event.dart';
part 'carts_state.dart';

class CartsBloc extends Bloc<CartsEvent, CartsState> {
  final CartsRepository cartsRepository;
  CartsBloc(this.cartsRepository) : super(const CartsState()) {
    on<CartsGetDataEvent>(_getDataCarts);
    on<CartsModifiyProductEvent>(_cartsModifiyProduct);
    on<CartsUpdateQuantityEvent>(_cartsUpdateQuantityProduct);
  }

  FutureOr<void> _getDataCarts(CartsGetDataEvent event, Emitter<CartsState> emit) async {
    if (event.isReload) {
      emit(state.copyWith(
          cartsRequestState: RequestState.loadingState,
          cartsUpdateQuantityProductState: RequestStateCart.normalState,
          cartModifiyState: RequestStateCart.normalState));
    }
    emit(state.copyWith(
        cartsUpdateQuantityProductState: RequestStateCart.normalState,
        cartModifiyState: RequestStateCart.normalState));
    final result = await cartsRepository.fetchCartsData();

    result.fold(
        (l) => emit(state.copyWith(
            cartsErorrMessage: l.erorrMessage,
            cartsRequestState: RequestState.erorrState,
            cartsUpdateQuantityProductState: RequestStateCart.normalState,
            cartModifiyState: RequestStateCart.normalState)),
        (r) => emit(state.copyWith(
            cartsModel: r,
            cartsRequestState: RequestState.loadedState,
            cartsUpdateQuantityProductState: RequestStateCart.normalState,
            cartModifiyState: RequestStateCart.normalState)));
  }

  FutureOr<void> _cartsModifiyProduct(
      CartsModifiyProductEvent event, Emitter<CartsState> emit) async {
    emit(state.copyWith(cartModifiyState: RequestStateCart.loadingState));
    if (carts![event.id] == false) {
      carts![event.id] = true;
    } else if (carts![event.id] == true) {
      carts![event.id] = false;
    }
    final result = await cartsRepository.fetchModifiyProduct(event.id);
    result.fold(
        (l) => emit(state.copyWith(
            cartModifiyState: RequestStateCart.erorrState, cartModifiyMessage: l.erorrMessage)),
        (r) => emit(
            state.copyWith(cartModifiyState: RequestStateCart.loadedState, cartModifiyModel: r)));
  }

  FutureOr<void> _cartsUpdateQuantityProduct(
      CartsUpdateQuantityEvent event, Emitter<CartsState> emit) async {
    emit(state.copyWith(
        cartsUpdateQuantityProductState: RequestStateCart.loadingState,
        cartModifiyState: RequestStateCart.normalState));
    final result =
        await cartsRepository.fetchUpdateQuantityProduct(id: event.id, quantity: event.quantity);
    result.fold(
        (l) => emit(state.copyWith(
            cartsUpdateQuantityProductMessage: l.erorrMessage,
            cartsUpdateQuantityProductState: RequestStateCart.erorrState,
            cartModifiyState: RequestStateCart.normalState)),
        (r) => emit(state.copyWith(
            cartsUpdateQuantityProductState: RequestStateCart.loadedState,
            cartModifiyState: RequestStateCart.normalState,
            cartsUpdateQuantityProductModel: r)));
  }
}
