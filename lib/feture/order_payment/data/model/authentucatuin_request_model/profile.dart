import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final bool? active;
  final String? profileType;
  final List<dynamic>? phones;
  final List<dynamic>? companyEmails;
  final String? companyName;
  final String? state;
  final String? country;
  final String? city;

  const Profile({
    this.id,
    this.createdAt,
    this.active,
    this.profileType,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        active: json['active'] as bool?,
        profileType: json['profile_type'] as String?,
        phones: json['phones'],
        companyEmails: json['company_emails'],
        companyName: json['company_name'] as String?,
        state: json['state'] as String?,
        country: json['country'] as String?,
        city: json['city'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'active': active,
        'profile_type': profileType,
        'phones': phones,
        'company_emails': companyEmails,
        'company_name': companyName,
        'state': state,
        'country': country,
        'city': city,
      };

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      active,
      profileType,
      phones,
      companyEmails,
      companyName,
      state,
      country,
      city,
    ];
  }
}
