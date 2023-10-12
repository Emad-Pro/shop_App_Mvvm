import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;

  const Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'] as int?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
      };

  @override
  List<Object?> get props => [id, price, oldPrice, discount, image];
}
