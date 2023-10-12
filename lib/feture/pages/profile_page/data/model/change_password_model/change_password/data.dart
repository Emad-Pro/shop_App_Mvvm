import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? email;

  const Data({this.email});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  @override
  List<Object?> get props => [email];
}
