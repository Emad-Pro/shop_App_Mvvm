part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState(
      {this.productDetailsModel,
      this.productDetailsState = RequestState.loadingState,
      this.productDetailsMessage = ''});
  final ProductDetailsModel? productDetailsModel;
  final RequestState productDetailsState;
  final String productDetailsMessage;
  ProductDetailsState copyWith({
    ProductDetailsModel? productDetailsModel,
    RequestState? productDetailsState,
    String? productDetailsMessage,
  }) =>
      ProductDetailsState(
          productDetailsModel: productDetailsModel ?? this.productDetailsModel,
          productDetailsMessage:
              productDetailsMessage ?? this.productDetailsMessage,
          productDetailsState: productDetailsState ?? this.productDetailsState);
  @override
  List<Object?> get props =>
      [productDetailsModel, productDetailsMessage, productDetailsState];
}
