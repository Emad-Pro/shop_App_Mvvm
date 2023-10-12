part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final String erorrMessage;
  final RequestState favoritesState;
  final FavoritesModel? favoritesModel;
  final AddDeleteFavoritesProductModel? favoritesModifiyProductModel;
  final RequestStateCart favoritesModifiyProductState;
  final String favoritesModifiyProductMessage;
  const FavoritesState({
    this.erorrMessage = "",
    this.favoritesState = RequestState.loadingState,
    this.favoritesModel,
    this.favoritesModifiyProductModel,
    this.favoritesModifiyProductState = RequestStateCart.normalState,
    this.favoritesModifiyProductMessage = '',
  });
  FavoritesState copyWith(
      {String? erorrMessage,
      RequestState? favoritesState,
      FavoritesModel? favoritesModel,
      AddDeleteFavoritesProductModel? favoritesModifiyProductModel,
      RequestStateCart? favoritesModifiyProductState,
      String? favoritesModifiyProductMessage}) {
    return FavoritesState(
      erorrMessage: erorrMessage ?? this.erorrMessage,
      favoritesState: favoritesState ?? this.favoritesState,
      favoritesModel: favoritesModel ?? this.favoritesModel,
      favoritesModifiyProductModel:
          favoritesModifiyProductModel ?? this.favoritesModifiyProductModel,
      favoritesModifiyProductState:
          favoritesModifiyProductState ?? this.favoritesModifiyProductState,
      favoritesModifiyProductMessage:
          favoritesModifiyProductMessage ?? this.favoritesModifiyProductMessage,
    );
  }

  @override
  List<Object?> get props => [
        erorrMessage,
        favoritesState,
        favoritesModel,
        favoritesModifiyProductModel,
        favoritesModifiyProductState,
        favoritesModifiyProductMessage
      ];
}
