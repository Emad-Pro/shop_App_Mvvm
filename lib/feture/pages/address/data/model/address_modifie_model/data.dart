import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? name;
  final String? city;
  final String? region;
  final String? details;
  final String? notes;
  final dynamic latitude;
  final dynamic longitude;
  final int? id;

  const Data({
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
    this.latitude,
    this.longitude,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'] as String?,
        city: json['city'] as String?,
        region: json['region'] as String?,
        details: json['details'] as String?,
        notes: json['notes'] as String?,
        latitude: json['latitude'],
        longitude: json['longitude'],
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'city': city,
        'region': region,
        'details': details,
        'notes': notes,
        'latitude': latitude,
        'longitude': longitude,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      name,
      city,
      region,
      details,
      notes,
      latitude,
      longitude,
      id,
    ];
  }
}
