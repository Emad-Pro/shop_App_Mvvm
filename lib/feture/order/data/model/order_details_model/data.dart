import 'package:equatable/equatable.dart';

import 'address.dart';
import 'product.dart';

class Data extends Equatable {
  final int? id;
  final dynamic cost;
  final dynamic discount;
  final dynamic points;
  final dynamic vat;
  final dynamic total;
  final int? pointsCommission;
  final String? promoCode;
  final String? paymentMethod;
  final String? date;
  final String? status;
  final Address? address;
  final List<Product>? products;

  const Data({
    this.id,
    this.cost,
    this.discount,
    this.points,
    this.vat,
    this.total,
    this.pointsCommission,
    this.promoCode,
    this.paymentMethod,
    this.date,
    this.status,
    this.address,
    this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        cost: json['cost'] as int?,
        discount: json['discount'] as int?,
        points: json['points'],
        vat: (json['vat'] as num?)?.toDouble(),
        total: (json['total'] as num?)?.toDouble(),
        pointsCommission: json['points_commission'] as int?,
        promoCode: json['promo_code'] as String?,
        paymentMethod: json['payment_method'] as String?,
        date: json['date'] as String?,
        status: json['status'] as String?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cost': cost,
        'discount': discount,
        'points': points,
        'vat': vat,
        'total': total,
        'points_commission': pointsCommission,
        'promo_code': promoCode,
        'payment_method': paymentMethod,
        'date': date,
        'status': status,
        'address': address?.toJson(),
        'products': products?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      cost,
      discount,
      points,
      vat,
      total,
      pointsCommission,
      promoCode,
      paymentMethod,
      date,
      status,
      address,
      products,
    ];
  }
}
