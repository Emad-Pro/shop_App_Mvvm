import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/presentation/view_model/bloc/categories_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view_model/bloc/address_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view_model/cubit/location_cubit.dart';
import 'package:shop_app_mvvm/feture/home/view_model/cubit/home_cubit.dart';
import '../../../../core/get_it/service_locator.dart';
import '../../auth/login/presentition/view_model/cubit/login_cubit.dart';
import '../../auth/logout/presentition/view_model/cubit/log_out_cubit.dart';
import '../../pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import '../../pages/profile_page/presentition/view_model/profile/bloc/profile_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => LoginCubit(getIt()),
      ),
      BlocProvider(
        create: (context) => FavoritesBloc(getIt())..add(GetFavoritesDataEvent(false)),
      ),
      BlocProvider(
        create: (context) => getIt<CartsBloc>()..add(CartsGetDataEvent(false)),
      ),
      BlocProvider(
        create: (context) => LogOutCubit(getIt()),
      ),
      BlocProvider.value(
        value: getIt<ProfileBloc>()..add(ProfileUserDataEvent()),
      ),
      BlocProvider(
        create: (context) => AddressBloc(getIt())..add(const GetAddressEvent(isReload: false)),
      ),
      BlocProvider(
        create: (context) => HomeCubit(),
      ),
      BlocProvider(
        create: (context) => LocationCubit(getIt()),
      ),
      BlocProvider(
        create: (context) => HomeShopBloc(getIt())
          ..add(GetHomeProductDataEvent(false))
          ..add(GetHomeProductDataEventOffline()),
      ),
      BlocProvider(
        create: (context) => CategoriesBloc(getIt())..add(const GetCategoriesProductEvent(false)),
      ),
    ], child: const HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: ((context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        return SafeArea(
          maintainBottomViewPadding: false,
          child: Scaffold(
            appBar: homeCubit.currentIndex != 3 && homeCubit.currentIndex != 0
                ? AppBar(
                    title: Text(homeCubit.titleAppBar[homeCubit.currentIndex].tr(context)),
                  )
                : null,
            body: homeCubit.bottomScreen[homeCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                useLegacyColorScheme: false,
                currentIndex: homeCubit.currentIndex,
                onTap: (index) {
                  homeCubit.changeBottomScreen(index);
                },
                items: homeCubit.bottomNavigatioBar(context)),
          ),
        );
      }),
    );
  }
}
