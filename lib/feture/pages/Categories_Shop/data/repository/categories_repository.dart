import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/data/model/home_product_model/product.dart';

import '../model/categories_product/categories_product.dart';

abstract class CategoriesRepository {
  Future<Either<Faliure, CategoriesProductModel>> fetchCategoriesProduct();
  Future<Either<Faliure, List<Product>>> fetchCategoriesProductDetails({required int id});
}

class CategoriesRepositoryImplementation extends CategoriesRepository {
  @override
  Future<Either<Faliure, CategoriesProductModel>> fetchCategoriesProduct() async {
    try {
      final response = await DioHelper.getData(url: 'categories', token: UserData.uId);
      return Right(CategoriesProductModel.fromJson(response!.data!));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<Product>>> fetchCategoriesProductDetails({required int id}) async {
    try {
      final response = await DioHelper.getData(url: 'categories/$id', token: UserData.uId);

      return Right(List<Product>.from(
        (response!.data['data']['data'] as List).map(
          (e) => Product.fromJson(e),
        ),
      ));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
