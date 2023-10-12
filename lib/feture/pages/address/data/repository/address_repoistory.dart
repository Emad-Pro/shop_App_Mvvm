import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/core/dio/dio_helper.dart';
import 'package:shop_app_mvvm/core/erorr/server_faliure.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';

import '../model/address_model/address_model.dart';
import '../model/address_model/datum.dart';
import '../model/address_modifie_model/address_modification_model.dart';

abstract class AddressRepoistory {
  Future<Either<Faliure, AddressModificationModel>> fetchNewAddress(
      {required DataAddress dataAddress});
  Future<Either<Faliure, AddressModel>> fetchGetAddress();
  Future<Either<Faliure, AddressModificationModel>> fetchUpdateAddress(
      {required DataAddress dataAddress, required int addressId});
  Future<Either<Faliure, AddressModificationModel>> fetchDeleteAddress(
      {required int addressId});
}

class AddressRepoistoryImplementation extends AddressRepoistory {
  @override
  Future<Either<Faliure, AddressModificationModel>> fetchNewAddress(
      {required DataAddress dataAddress}) async {
    try {
      final result = await DioHelper.postData(
          url: 'addresses', data: dataAddress.toJson(), token: UserData.uId);
      print(result.data);
      return Right(AddressModificationModel.fromJson(result.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, AddressModel>> fetchGetAddress() async {
    try {
      final result =
          await DioHelper.getData(url: 'addresses', token: UserData.uId);

      return Right(AddressModel.fromJson(result!.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, AddressModificationModel>> fetchDeleteAddress(
      {required int addressId}) async {
    try {
      final result = await DioHelper.deleteData(
          url: 'addresses/$addressId', token: UserData.uId);
      print(result.data);
      return Right(AddressModificationModel.fromJson(result.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, AddressModificationModel>> fetchUpdateAddress(
      {required DataAddress dataAddress, required int addressId}) async {
    print(dataAddress.name);
    try {
      final result = await DioHelper.putData(
          url: 'addresses/$addressId',
          data: dataAddress.toJson(),
          token: UserData.uId);

      return Right(AddressModificationModel.fromJson(result.data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
