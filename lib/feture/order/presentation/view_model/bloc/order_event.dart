part of 'order_bloc.dart';

class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class GetOrderDataEvent extends OrderEvent {}

class GetOrderDetailsEvent extends OrderEvent {
  final int id;

  const GetOrderDetailsEvent(this.id);
}

class CreateOrderNewEvent extends OrderEvent {
  final Map<String, dynamic> data;

  const CreateOrderNewEvent(this.data);
}

class CancelOrderEvent extends OrderEvent {
  final int id;

  const CancelOrderEvent(this.id);
}
