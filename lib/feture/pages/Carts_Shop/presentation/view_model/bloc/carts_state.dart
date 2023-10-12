part of 'carts_bloc.dart';

class CartsState extends Equatable {
  final String cartsErorrMessage;
  final RequestState cartsRequestState;
  final CartsModel? cartsModel;
  final String cartsUpdateQuantityProductMessage;
  final RequestStateCart cartsUpdateQuantityProductState;
  final QuantityProductModel? cartsUpdateQuantityProductModel;
  final CartAddModel? cartModifiyModel;
  final RequestStateCart cartModifiyState;
  final String cartModifiyMessage;
  const CartsState(
      {this.cartsErorrMessage = '',
      this.cartsModel,
      this.cartsRequestState = RequestState.loadingState,
      this.cartsUpdateQuantityProductMessage = '',
      this.cartsUpdateQuantityProductModel,
      this.cartsUpdateQuantityProductState = RequestStateCart.normalState,
      this.cartModifiyModel,
      this.cartModifiyState = RequestStateCart.normalState,
      this.cartModifiyMessage = ''});
  CartsState copyWith(
      {String? cartsErorrMessage,
      RequestState? cartsRequestState,
      CartsModel? cartsModel,
      String? cartsUpdateQuantityProductMessage,
      RequestStateCart? cartsUpdateQuantityProductState,
      QuantityProductModel? cartsUpdateQuantityProductModel,
      CartAddModel? cartModifiyModel,
      RequestStateCart? cartModifiyState,
      String? cartModifiyMessage}) {
    return CartsState(
        cartsErorrMessage: cartsErorrMessage ?? this.cartsErorrMessage,
        cartsModel: cartsModel ?? this.cartsModel,
        cartsRequestState: cartsRequestState ?? this.cartsRequestState,
        cartsUpdateQuantityProductMessage:
            cartsUpdateQuantityProductMessage ?? this.cartsUpdateQuantityProductMessage,
        cartsUpdateQuantityProductState:
            cartsUpdateQuantityProductState ?? this.cartsUpdateQuantityProductState,
        cartsUpdateQuantityProductModel:
            cartsUpdateQuantityProductModel ?? this.cartsUpdateQuantityProductModel,
        cartModifiyModel: cartModifiyModel ?? this.cartModifiyModel,
        cartModifiyState: cartModifiyState ?? this.cartModifiyState,
        cartModifiyMessage: cartModifiyMessage ?? this.cartModifiyMessage);
  }

  @override
  List<Object?> get props => [
        cartsErorrMessage,
        cartsRequestState,
        cartsModel,
        cartsUpdateQuantityProductMessage,
        cartsUpdateQuantityProductState,
        cartsUpdateQuantityProductModel,
        cartModifiyModel,
        cartModifiyState,
        cartModifiyMessage
      ];
}
