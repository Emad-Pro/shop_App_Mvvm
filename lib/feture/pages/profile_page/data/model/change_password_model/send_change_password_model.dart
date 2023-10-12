import 'package:equatable/equatable.dart';

class SendChangePasswordModel extends Equatable {
  final String? currentPassword;
  final String? newPassword;

  const SendChangePasswordModel({this.currentPassword, this.newPassword});

  factory SendChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return SendChangePasswordModel(
      currentPassword: json['current_password'] as String?,
      newPassword: json['new_password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'current_password': currentPassword,
        'new_password': newPassword,
      };

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
