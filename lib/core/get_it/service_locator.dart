import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app_mvvm/core/language_cache/language_cache.dart';
import 'package:shop_app_mvvm/core/service/location/location.dart';
import 'package:shop_app_mvvm/feture/auth/singup/data/repository/signUp_repository.dart';
import 'package:shop_app_mvvm/feture/order/data/repository/order_repository.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/data/repository/carts_repository.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/data/repository/categories_repository.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/data/repository/Favorites_repository.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/data/repository/home_repository.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view_model/cubit/setting_cubit.dart';
import '../../feture/auth/login/data/repository/login_repository.dart';
import '../../feture/auth/logout/data/repository/logout_repository.dart';
import '../../feture/pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import '../../feture/pages/Categories_Shop/presentation/view_model/bloc/categories_bloc.dart';
import '../../feture/pages/profile_page/data/repository/home_repsitory.dart';
import '../../feture/pages/address/data/repository/address_repoistory.dart';
import '../../feture/pages/profile_page/presentition/view_model/profile/bloc/profile_bloc.dart';
import '../../feture/product_details/data/repository/product_details_repository.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerFactory(() => ProfileBloc(getIt()));
    getIt.registerFactory(() => CartsBloc(getIt()));
    getIt.registerFactory(() => FavoritesBloc(getIt()));
    getIt.registerFactory(() => CategoriesBloc(getIt()));
    getIt.registerFactory(() => SettingCubit(getIt()));
    getIt.registerFactory(() => LocaleDataSource());
    getIt.registerFactory(() => Dio());
    getIt.registerFactory(() => LanguageCacheHelper());
    getIt.registerSingleton<LoginRepository>(LoginRepositoryImplemention());
    getIt.registerSingleton<SignUpRepository>(SignUpRepositoryImplemention());
    getIt.registerSingleton<CategoriesRepository>(CategoriesRepositoryImplementation());
    getIt.registerSingleton<FavoritesRepository>(FavoritesRepositoryImplementation());
    getIt.registerSingleton<CartsRepository>(CartsRepositoryImplementation());
    getIt.registerSingleton<ProductDetailsRepository>(ProductDetailsRepositoryImp());

    getIt.registerSingleton<LogoutRepository>(LogoutRepositoryImplemetition());
    getIt.registerSingleton<ProfileRepsitory>(ProfileRepsitoryImplemention());
    getIt.registerSingleton<OrderRepository>(OrderRepositoryImp());
    getIt.registerSingleton<AddressRepoistory>(AddressRepoistoryImplementation());
    getIt.registerSingleton<HomeShopRepository>(HomeShopRepositoryImplementation());
  }
}
