import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final double? total;
  final String? date;
  final String? status;

  const Datum({this.id, this.total, this.date, this.status});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        total: (json['total'] as num?)?.toDouble(),
        date: json['date'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'total': total,
        'date': date,
        'status': status,
      };

  @override
  List<Object?> get props => [id, total, date, status];
}
