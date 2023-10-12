part of 'home_shop_bloc.dart';

abstract class HomeShopEvent extends Equatable {
  const HomeShopEvent();

  @override
  List<Object> get props => [];
}

class GetHomeProductDataEvent extends HomeShopEvent {
  final bool? reload;
  GetHomeProductDataEvent(this.reload);
}

class GetHomeProductDataEventOffline extends HomeShopEvent {}
