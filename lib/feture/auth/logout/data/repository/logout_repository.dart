import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/dio/dio_helper.dart';
import '../../../../../core/erorr/server_faliure.dart';
import '../../../../../core/user_data/uId.dart';
import '../model/logout_model/logout_model.dart';

abstract class LogoutRepository {
  Future<Either<Faliure, LogoutModel>> fetchLogiOutUser();
}

class LogoutRepositoryImplemetition extends LogoutRepository {
  @override
  Future<Either<Faliure, LogoutModel>> fetchLogiOutUser() async {
    try {
      final result = await DioHelper.postData(url: "logout", token: UserData.uId!);

      return Right(LogoutModel.fromJson(result.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
