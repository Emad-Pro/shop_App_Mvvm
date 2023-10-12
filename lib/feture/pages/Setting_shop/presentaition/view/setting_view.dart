import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_changeLanguageWidget.dart';
import 'package:shop_app_mvvm/core/widget/custom_changeModelWidget.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/presentation/view_model/bloc/categories_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view/widget/custom_listTile.dart';
import 'package:shop_app_mvvm/feture/pages/Setting_shop/presentaition/view/widget/howIm_widget.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view_model/bloc/address_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/profile_page/presentition/view/profile_page.dart';

import '../../../../order/presentation/view/order.dart';
import '../view_model/cubit/setting_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
      listener: (context, state) {
        if (state is ChangeLocaleState) {
          BlocProvider.of<CategoriesBloc>(context).add(const GetCategoriesProductEvent(true));
          BlocProvider.of<CartsBloc>(context).add(CartsGetDataEvent(true));
          BlocProvider.of<FavoritesBloc>(context).add(GetFavoritesDataEvent(true));
          BlocProvider.of<AddressBloc>(context).add(const GetAddressEvent(isReload: true));

          BlocProvider.of<HomeShopBloc>(context).add(GetHomeProductDataEvent(true));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomWidgetChangeLanguage(
              horizontalTitleGap: MediaQuery.of(context).size.width * 0.4,
            ),
            CustomWidgetChangeDarkMode(
              horizontalTitleGap: MediaQuery.of(context).size.width * 0.3,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomListTile(
              title: "orders".tr(context).toUpperCase(),
              widget: const OrderScreen(),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomListTile(
              title: "Profile".tr(context).toUpperCase(),
              widget: const ProfilePage(),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomListTile(
              title: "How I,m".tr(context).toUpperCase(),
              widget: const HowImWidget(),
            ),
          ],
        );
      },
    );
  }
}
