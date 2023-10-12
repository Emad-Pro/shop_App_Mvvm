part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final CategoriesProductModel? categoriesProductModel;
  final RequestState categoriesState;
  final String categoriesMessage;
  final List<Product>? categoriesDetailsProduct;
  final RequestState categoriesDetailsState;
  final String categoriesDetailsErorrMessage;

  const CategoriesState({
    this.categoriesProductModel,
    this.categoriesState = RequestState.loadingState,
    this.categoriesMessage = '',
    this.categoriesDetailsProduct,
    this.categoriesDetailsState = RequestState.loadingState,
    this.categoriesDetailsErorrMessage = '',
  });
  CategoriesState copyWith(
      {CategoriesProductModel? categoriesProductModel,
      RequestState? categoriesState,
      String? categoriesMessage,
      List<Product>? categoriesDetailsProduct,
      RequestState? categoriesDetailsState,
      String? categoriesDetailsErorrMessage}) {
    return CategoriesState(
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesProductModel:
          categoriesProductModel ?? this.categoriesProductModel,
      categoriesDetailsErorrMessage:
          categoriesDetailsErorrMessage ?? this.categoriesDetailsErorrMessage,
      categoriesDetailsProduct:
          categoriesDetailsProduct ?? this.categoriesDetailsProduct,
      categoriesDetailsState:
          categoriesDetailsState ?? this.categoriesDetailsState,
    );
  }

  @override
  List<Object?> get props => [
        categoriesMessage,
        categoriesState,
        categoriesProductModel,
        categoriesDetailsErorrMessage,
        categoriesDetailsProduct,
        categoriesDetailsState,
      ];
}
