import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';

import '../model/change_password_model/change_password/change_password.dart';
import '../model/change_password_model/send_change_password_model.dart';
import '../model/profile_model/profile_model.dart';
import '../model/update_profile_model/update_profile_model.dart';

abstract class ProfileRepsitory {
  Future<Either<Faliure, ProfileModel>> fetchUserProfile();
  Future<Either<Faliure, ProfileModel>> fetchUpdateUserProfile({required UpdateProfileModel data});
  Future<Either<Faliure, ChangePasswordModel>> fetchChanePasswordUserProfile(
      {required SendChangePasswordModel data});
}

class ProfileRepsitoryImplemention extends ProfileRepsitory {
  @override
  Future<Either<Faliure, ProfileModel>> fetchUserProfile() async {
    try {
      final response = await DioHelper.getData(url: 'profile', token: UserData.uId);

      return Right(ProfileModel.fromJson(response!.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, ProfileModel>> fetchUpdateUserProfile(
      {required UpdateProfileModel data}) async {
    try {
      final response =
          await DioHelper.putData(url: 'update-profile', token: UserData.uId, data: data.toJson());

      return Right(ProfileModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, ChangePasswordModel>> fetchChanePasswordUserProfile(
      {required SendChangePasswordModel data}) async {
    try {
      final response =
          await DioHelper.putData(url: 'change-password', token: UserData.uId, data: data.toJson());

      return Right(ChangePasswordModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
