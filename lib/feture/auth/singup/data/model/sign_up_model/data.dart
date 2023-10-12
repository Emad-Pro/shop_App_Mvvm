import 'package:equatable/equatable.dart';

class DataSignUp extends Equatable {
  final String? name;
  final String? email;
  final String? phone;

  final String? password;

  const DataSignUp({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  factory DataSignUp.fromJson(Map<String, dynamic> json) => DataSignUp(
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };

  @override
  List<Object?> get props => [name, email, phone, password];
}
