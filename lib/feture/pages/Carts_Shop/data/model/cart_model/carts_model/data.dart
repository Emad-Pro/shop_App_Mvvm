import 'package:equatable/equatable.dart';

import 'cart_item.dart';

class Data extends Equatable {
  final List<CartItem>? cartItems;
  final dynamic subTotal;
  final dynamic total;

  const Data({this.cartItems, this.subTotal, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: json['sub_total'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'total': total,
      };

  @override
  List<Object?> get props => [cartItems, subTotal, total];
}
