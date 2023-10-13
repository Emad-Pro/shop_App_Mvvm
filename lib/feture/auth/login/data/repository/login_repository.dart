import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/feture/auth/login/data/model/data_login.dart';

import '../../../../../core/erorr/server_faliure.dart';
import '../model/login_model.dart';

abstract class LoginRepository {
  Future<Either<ServerFaliure, LoginModel>> fetchLoginApp({required DataLogin dataLogin});
}

class LoginRepositoryImplemention extends LoginRepository {
  @override
  Future<Either<ServerFaliure, LoginModel>> fetchLoginApp({required DataLogin dataLogin}) async {
    try {
      final result = await DioHelper.postData(url: "login", data: dataLogin.toJson());

      return Right(LoginModel.fromJson(result.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
