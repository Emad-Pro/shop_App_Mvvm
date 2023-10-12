import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/core/enum.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/data/repository/categories_repository.dart';

import '../../../../Home_Shop/data/model/home_product_model/product.dart';
import '../../../data/model/categories_product/categories_product.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesBloc(this.categoriesRepository) : super(const CategoriesState()) {
    on<GetCategoriesProductEvent>(_getCategoriesProduct);
    on<GetCategoriesProductDetailsEvent>(_getCategoriesDetailsProduct);
  }

  FutureOr<void> _getCategoriesProduct(
      GetCategoriesProductEvent event, Emitter<CategoriesState> emit) async {
    if (event.isReload) {
      emit(state.copyWith(
        categoriesState: RequestState.loadingState,
      ));
    }
    final result = await categoriesRepository.fetchCategoriesProduct();
    result.fold(
        (l) => emit(state.copyWith(
            categoriesState: RequestState.erorrState, categoriesMessage: l.erorrMessage)),
        (r) => emit(
            state.copyWith(categoriesState: RequestState.loadedState, categoriesProductModel: r)));
  }

  FutureOr<void> _getCategoriesDetailsProduct(
      GetCategoriesProductDetailsEvent event, Emitter<CategoriesState> emit) async {
    if (event.isReload) {
      emit(state.copyWith(categoriesDetailsState: RequestState.loadingState));
    }
    await categoriesRepository.fetchCategoriesProductDetails(id: event.id).then((value) {
      value.fold(
          (l) => emit(state.copyWith(
              categoriesDetailsErorrMessage: l.erorrMessage,
              categoriesDetailsState: RequestState.erorrState)),
          (r) => emit(state.copyWith(
              categoriesDetailsProduct: r, categoriesDetailsState: RequestState.loadedState)));
    });
  }
}
