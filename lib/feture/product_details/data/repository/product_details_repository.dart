import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';
import 'package:shop_app_mvvm/feture/product_details/data/model/product_details_model/product_details_model.dart';

abstract class ProductDetailsRepository {
  Future<Either<Faliure, ProductDetailsModel>> fetchProductDetailsData({required int id});
}

class ProductDetailsRepositoryImp extends ProductDetailsRepository {
  @override
  Future<Either<Faliure, ProductDetailsModel>> fetchProductDetailsData({required int id}) async {
    try {
      final response = await DioHelper.getData(url: "products/$id", token: UserData.uId);
      return Right(ProductDetailsModel.fromJson(response!.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
