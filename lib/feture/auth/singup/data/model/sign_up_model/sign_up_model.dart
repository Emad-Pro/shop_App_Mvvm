import 'package:equatable/equatable.dart';

import 'data.dart';

class SignUpModel extends Equatable {
  final bool? status;
  final String? message;
  final DataSignUp? data;

  const SignUpModel({this.status, this.message, this.data});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : DataSignUp.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
