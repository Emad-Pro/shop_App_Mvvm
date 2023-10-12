part of 'product_details_bloc.dart';

class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent(this.id);
  final int id;
  @override
  List<Object> get props => [id];
}
