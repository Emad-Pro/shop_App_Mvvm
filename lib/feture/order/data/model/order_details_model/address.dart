import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int? id;
  final String? name;
  final String? city;
  final String? region;
  final String? details;
  final String? notes;
  final double? latitude;
  final double? longitude;

  const Address({
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
    this.latitude,
    this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json['id'] as int?,
        name: json['name'] as String?,
        city: json['city'] as String?,
        region: json['region'] as String?,
        details: json['details'] as String?,
        notes: json['notes'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'region': region,
        'details': details,
        'notes': notes,
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      city,
      region,
      details,
      notes,
      latitude,
      longitude,
    ];
  }
}
