import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/core/shared_preferences/CacheHelper.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';

import '../model/home_product_model/home_product_model.dart';

abstract class HomeShopRepository {
  Future<Either<Faliure, HomeProductModel>> fetchHomeData();
  Future<HomeProductModel> fetchHomeDataOffline();
}

class HomeShopRepositoryImplementation extends HomeShopRepository {
  @override
  Future<Either<Faliure, HomeProductModel>> fetchHomeData() async {
    try {
      final result = await DioHelper.getData(url: 'home', token: UserData.uId);
      if (result!.data != null) {
        CacheHelper.save("homeModelData", HomeProductModel.fromJson(result.data));
      }
      return Right(HomeProductModel.fromJson(result.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<HomeProductModel> fetchHomeDataOffline() async {
    return HomeProductModel.fromJson(await CacheHelper.read("homeModelData"));
  }
}
