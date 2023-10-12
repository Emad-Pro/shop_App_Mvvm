part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesProductEvent extends CategoriesEvent {
  final bool isReload;

  const GetCategoriesProductEvent(this.isReload);
}

class GetCategoriesProductDetailsEvent extends CategoriesEvent {
  final bool isReload;
  final int id;
  const GetCategoriesProductDetailsEvent(this.id,this.isReload);
}
