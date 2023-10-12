import 'package:equatable/equatable.dart';

class OrderRegistrationApiModel extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final bool? deliveryNeeded;
  final int? amountCents;
  final String? currency;
  final String? merchantOrderId;
  final String? token;
  final String? url;

  const OrderRegistrationApiModel({
    this.id,
    this.createdAt,
    this.deliveryNeeded,
    this.amountCents,
    this.currency,
    this.merchantOrderId,
    this.token,
    this.url,
  });

  factory OrderRegistrationApiModel.fromJson(Map<String, dynamic> json) {
    return OrderRegistrationApiModel(
      id: json['id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deliveryNeeded: json['delivery_needed'] as bool?,
      amountCents: json['amount_cents'] as int?,
      currency: json['currency'] as String?,
      merchantOrderId: json['merchant_order_id'] as String?,
      token: json['token'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'delivery_needed': deliveryNeeded,
        'amount_cents': amountCents,
        'currency': currency,
        'merchant_order_id': merchantOrderId,
        'token': token,
        'url': url,
      };

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      deliveryNeeded,
      amountCents,
      currency,
      merchantOrderId,
      token,
      url,
    ];
  }
}
