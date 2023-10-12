import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';
import 'package:shop_app_mvvm/feture/order/data/model/order_create_model/order_create_model.dart';
import 'package:shop_app_mvvm/feture/order/data/model/order_details_model/order_details_model.dart';

import '../model/order_cancel_model/order_cancel_model.dart';
import '../model/order_model/order_model.dart';

abstract class OrderRepository {
  Future<Either<Faliure, OrderModel>> fetchOrderData();
  Future<Either<Faliure, OrderDetailsModel>> fetchOrderDetails({required int orderId});
  Future<Either<Faliure, OrderCreateModel>> fetchOrderCreate(
      {required Map<String, dynamic> orderData});
  Future<Either<Faliure, CancelOrderModel>> fetchCancelOrder({required int id});
}

class OrderRepositoryImp extends OrderRepository {
  @override
  Future<Either<Faliure, OrderModel>> fetchOrderData() async {
    try {
      final response = await DioHelper.getData(url: 'orders', token: UserData.uId);
      return Right(OrderModel.fromJson(response!.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, OrderDetailsModel>> fetchOrderDetails({required int orderId}) async {
    try {
      final response = await DioHelper.getData(url: 'orders/$orderId', token: UserData.uId);
      return Right(OrderDetailsModel.fromJson(response!.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, OrderCreateModel>> fetchOrderCreate(
      {required Map<String, dynamic> orderData}) async {
    try {
      final response =
          await DioHelper.postData(url: 'orders', token: UserData.uId, data: orderData);
      return Right(OrderCreateModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, CancelOrderModel>> fetchCancelOrder({required int id}) async {
    try {
      final response = await DioHelper.getData(url: 'orders/$id/cancel', token: UserData.uId);
      return Right(CancelOrderModel.fromJson(response!.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
