import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/core/enum.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/data/model/favorites_model/favorites_model.dart';

import '../../../../Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';
import '../../../data/model/add_Delete_favorites_product/add_delete_favorites_product/add_delete_favorites_product.dart';
import '../../../data/repository/Favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository favoritesRepository;
  FavoritesBloc(this.favoritesRepository) : super(const FavoritesState()) {
    on<GetFavoritesDataEvent>(_fetchGetFavoritesData);
    on<ModifyFavoritesEvent>(_fetchModelfiyFavorites);
  }

  FutureOr<void> _fetchGetFavoritesData(
      GetFavoritesDataEvent event, Emitter<FavoritesState> emit) async {
    if (event.isReload) {
      emit(state.copyWith(
          favoritesState: RequestState.loadingState,
          favoritesModifiyProductState: RequestStateCart.normalState));
    }
    final result = await favoritesRepository.fetchFavoritesProduct();
    result.fold(
        (l) => emit(state.copyWith(
            erorrMessage: l.erorrMessage,
            favoritesState: RequestState.erorrState,
            favoritesModifiyProductState: RequestStateCart.normalState)),
        (r) => emit(state.copyWith(
            favoritesModel: r,
            favoritesState: RequestState.loadedState,
            favoritesModifiyProductState: RequestStateCart.normalState)));
  }

  FutureOr<void> _fetchModelfiyFavorites(
      ModifyFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(favoritesModifiyProductState: RequestStateCart.loadingState));
    if (favorites![event.id] == false) {
      favorites![event.id] = true;
    } else if (favorites![event.id] == true) {
      favorites![event.id] = false;
    }
    await favoritesRepository.fetchModeifyFavoritesProduct(id: event.id).then((value) {
      value.fold(
          (l) => emit(state.copyWith(
              favoritesModifiyProductState: RequestStateCart.erorrState,
              favoritesModifiyProductMessage: l.erorrMessage)),
          (r) => emit(state.copyWith(
              favoritesModifiyProductState: RequestStateCart.loadedState,
              favoritesModifiyProductModel: r)));
    });
  }
}
