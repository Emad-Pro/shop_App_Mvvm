import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/data/model/favorites_model/favorites_model.dart';

import '../../../../../../../../core/dio/dio_helper.dart';
import '../../../../../../../../core/user_data/uId.dart';
import '../model/add_Delete_favorites_product/add_delete_favorites_product/add_delete_favorites_product.dart';

abstract class FavoritesRepository {
  Future<Either<Faliure, FavoritesModel>> fetchFavoritesProduct();
  Future<Either<Faliure, AddDeleteFavoritesProductModel>> fetchModeifyFavoritesProduct(
      {required int id});
}

class FavoritesRepositoryImplementation extends FavoritesRepository {
  @override
  Future<Either<Faliure, FavoritesModel>> fetchFavoritesProduct() async {
    try {
      final response = await DioHelper.getData(url: 'favorites', token: UserData.uId);
      return Right(FavoritesModel.fromJson(response!.data!));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, AddDeleteFavoritesProductModel>> fetchModeifyFavoritesProduct(
      {required int id}) async {
    try {
      final response =
          await DioHelper.postData(url: 'favorites', token: UserData.uId, data: {'product_id': id});
      return Right(AddDeleteFavoritesProductModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
