import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/feture/product_details/data/repository/product_details_repository.dart';

import '../../../../../core/enum.dart';
import '../../../data/model/product_details_model/product_details_model.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductDetailsRepository productDetailsRepository;
  ProductDetailsBloc(this.productDetailsRepository)
      : super(ProductDetailsState()) {
    on<ProductDetailsEvent>(_getProductDetails);
  }

  FutureOr<void> _getProductDetails(
      ProductDetailsEvent event, Emitter<ProductDetailsState> emit) async {
    final result =
        await productDetailsRepository.fetchProductDetailsData(id: event.id);
    result.fold(
        (l) => emit(state.copyWith(
            productDetailsState: RequestState.erorrState,
            productDetailsMessage: l.erorrMessage)),
        (r) => emit(state.copyWith(
            productDetailsModel: r,
            productDetailsState: RequestState.loadedState)));
  }
}
