part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoritesDataEvent extends FavoritesEvent {
  final bool isReload;

  GetFavoritesDataEvent(this.isReload);
}

class ModifyFavoritesEvent extends FavoritesEvent {
  final int id;

  const ModifyFavoritesEvent(this.id);
}
