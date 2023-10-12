import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/data/model/cart_add_model/cart_add_model.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/data/model/cart_model/carts_model/carts_model.dart';

import '../model/quantity_Product_model/quantity_product.dart';

abstract class CartsRepository {
  Future<Either<Faliure, CartsModel>> fetchCartsData();
  Future<Either<Faliure, CartAddModel>> fetchModifiyProduct(int id);
  Future<Either<Faliure, QuantityProductModel>> fetchUpdateQuantityProduct(
      {required int id, required int quantity});
}

class CartsRepositoryImplementation extends CartsRepository {
  @override
  Future<Either<Faliure, CartsModel>> fetchCartsData() async {
    try {
      final response =
          await DioHelper.getData(url: "carts", token: UserData.uId);
      return Right(CartsModel.fromJson(response!.data!));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, CartAddModel>> fetchModifiyProduct(int id) async {
    try {
      final response = await DioHelper.postData(
          url: 'carts', token: UserData.uId, data: {"product_id": id});

      return Right(CartAddModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, QuantityProductModel>> fetchUpdateQuantityProduct(
      {required int id, required int quantity}) async {
    try {
      final response = await DioHelper.putData(
          url: 'carts/$id', token: UserData.uId, data: {"quantity": quantity});

      return Right(QuantityProductModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
