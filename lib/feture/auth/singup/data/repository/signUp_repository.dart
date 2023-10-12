import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';

import '../../../../../core/erorr/server_faliure.dart';
import '../model/sign_up_model/data.dart';
import '../model/sign_up_model/sign_up_model.dart';

abstract class SignUpRepository {
  Future<Either<ServerFaliure, SignUpModel>> fetchSignUpApp({required DataSignUp dataSignUp});
}

class SignUpRepositoryImplemention extends SignUpRepository {
  @override
  Future<Either<ServerFaliure, SignUpModel>> fetchSignUpApp(
      {required DataSignUp dataSignUp}) async {
    try {
      print(dataSignUp.toJson());
      final result = await DioHelper.postData(url: "register", data: dataSignUp.toJson());
      return Right(SignUpModel.fromJson(result.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
