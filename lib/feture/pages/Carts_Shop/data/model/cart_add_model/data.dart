import 'package:equatable/equatable.dart';

import 'product.dart';

class Data extends Equatable {
  final int? id;
  final int? quantity;
  final Product? product;

  const Data({this.id, this.quantity, this.product});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };

  @override
  List<Object?> get props => [id, quantity, product];
}
