part of 'home_shop_bloc.dart';

class HomeShopState extends Equatable {
  final HomeProductModel? homeProductModel;
  final RequestState homeProductState;
  final String homeProductMessage;

  const HomeShopState({
    this.homeProductModel,
    this.homeProductState = RequestState.loadingState,
    this.homeProductMessage = '',
  });
  HomeShopState copyWith({
    HomeProductModel? homeProductModel,
    RequestState? homeProductState,
    String? homeProductMessage,
  }) {
    return HomeShopState(
      homeProductState: homeProductState ?? this.homeProductState,
      homeProductModel: homeProductModel ?? this.homeProductModel,
      homeProductMessage: homeProductMessage ?? this.homeProductMessage,
    );
  }

  @override
  List<Object?> get props => [
        homeProductState,
        homeProductModel,
        homeProductMessage,
      ];
}

class HomeShopLoadingState extends HomeShopState {}
