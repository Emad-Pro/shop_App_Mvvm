import 'package:equatable/equatable.dart';

import 'profile.dart';

class AuthentucatuionRequestModel extends Equatable {
  final Profile? profile;
  final String? token;

  const AuthentucatuionRequestModel({this.profile, this.token});

  factory AuthentucatuionRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthentucatuionRequestModel(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'profile': profile?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [profile, token];
}
