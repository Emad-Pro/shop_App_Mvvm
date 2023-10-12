import 'package:equatable/equatable.dart';

class UpdateProfileModel extends Equatable {
  final String? name;
  final String? phone;
  final String? email;

  const UpdateProfileModel({this.name, this.phone, this.email});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
      };

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
      ];
}
