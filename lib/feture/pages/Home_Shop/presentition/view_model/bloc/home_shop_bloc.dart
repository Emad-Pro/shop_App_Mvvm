import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/core/shared_preferences/CacheHelper.dart';

import 'package:shop_app_mvvm/feture/pages/Home_Shop/data/repository/home_repository.dart';

import '../../../../../../../../../core/enum.dart';
import '../../../data/model/home_product_model/home_product_model.dart';

part 'home_shop_event.dart';
part 'home_shop_state.dart';

Map<int, bool>? favorites = {};
Map<int, bool>? carts = {};

class HomeShopBloc extends Bloc<HomeShopEvent, HomeShopState> {
  final HomeShopRepository homeRepository;

  HomeShopBloc(this.homeRepository) : super(const HomeShopState()) {
    on<GetHomeProductDataEvent>(_getHomeProductData);
    on<GetHomeProductDataEventOffline>(_getHomeProductDataOffline);
  }
  FutureOr<void> _getHomeProductData(
      GetHomeProductDataEvent event, Emitter<HomeShopState> emit) async {
    if (event.reload == true) emit(HomeShopLoadingState());
    await homeRepository.fetchHomeData().then((value) {
      value.fold(
          (l) => emit(
                state.copyWith(
                    homeProductState: RequestState.erorrState, homeProductMessage: l.erorrMessage),
              ), (r) {
        for (var element in r.data!.products!) {
          favorites!.addAll({element.id!: element.inFavorites!});
          carts!.addAll({element.id!: element.inCart!});
        }

        emit(
          state.copyWith(
            homeProductState: RequestState.loadedState,
            homeProductModel: r,
          ),
        );
      });
    });
  }

  FutureOr<void> _getHomeProductDataOffline(
      GetHomeProductDataEventOffline event, Emitter<HomeShopState> emit) async {
    homeRepository
        .fetchHomeDataOffline()
        .then((value) => {emit(state.copyWith(homeProductModel: value))});
  }
}
