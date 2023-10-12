import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? paymentMethod;
  final dynamic cost;
  final double? vat;
  final int? discount;
  final dynamic points;
  final dynamic total;
  final int? id;

  const Data({
    this.paymentMethod,
    this.cost,
    this.vat,
    this.discount,
    this.points,
    this.total,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentMethod: json['payment_method'] as String?,
        cost: json['cost'],
        vat: (json['vat']),
        discount: json['discount'],
        points: (json['points']),
        total: (json['total']),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'payment_method': paymentMethod,
        'cost': cost,
        'vat': vat,
        'discount': discount,
        'points': points,
        'total': total,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      paymentMethod,
      cost,
      vat,
      discount,
      points,
      total,
      id,
    ];
  }
}
