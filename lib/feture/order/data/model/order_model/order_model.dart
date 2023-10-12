import 'package:equatable/equatable.dart';

import 'data.dart';

class OrderModel extends Equatable {
  final bool? status;
  final dynamic message;
  final Data? data;

  const OrderModel({this.status, this.message, this.data});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
