import 'package:equatable/equatable.dart';

import 'cart.dart';

class Data extends Equatable {
  final Cart? cart;
  final dynamic subTotal;
  final dynamic total;

  const Data({this.cart, this.subTotal, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cart: json['cart'] == null
            ? null
            : Cart.fromJson(json['cart'] as Map<String, dynamic>),
        subTotal: json['sub_total'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'cart': cart?.toJson(),
        'sub_total': subTotal,
        'total': total,
      };

  @override
  List<Object?> get props => [cart, subTotal, total];
}
