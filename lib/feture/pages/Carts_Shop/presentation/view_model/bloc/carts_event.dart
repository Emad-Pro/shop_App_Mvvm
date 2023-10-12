part of 'carts_bloc.dart';

abstract class CartsEvent extends Equatable {
  const CartsEvent();

  @override
  List<Object?> get props => [];
}

class CartsGetDataEvent extends CartsEvent {
  final bool isReload;

  CartsGetDataEvent(this.isReload);
}

class CartsModifiyProductEvent extends CartsEvent {
  final int id;

  const CartsModifiyProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class CartsUpdateQuantityEvent extends CartsEvent {
  final int quantity;
  final int id;

  const CartsUpdateQuantityEvent({required this.quantity, required this.id});
}
