import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final int? quantity;
  final int? price;
  final String? name;
  final String? image;

  const Product({
    this.id,
    this.quantity,
    this.price,
    this.name,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'price': price,
        'name': name,
        'image': image,
      };

  @override
  List<Object?> get props => [id, quantity, price, name, image];
}
