import 'package:equatable/equatable.dart';

class DataLogin extends Equatable {
  final String? email;
  final String? password;

  const DataLogin({this.email, this.password});

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [email, password];
}
