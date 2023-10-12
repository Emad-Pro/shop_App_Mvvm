import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import '../../../pages/Carts_Shop/presentation/view/cart_view.dart';
import '../../../pages/Categories_Shop/presentation/view/Categories_Product.dart';

import '../../../pages/Favorites_Shop/presentation/view/Favorites_view.dart';
import '../../../pages/Home_Shop/presentition/view/home_product_view.dart';
import '../../../pages/Setting_shop/presentaition/view/setting_view.dart';
import '../../../pages/address/presentition/view/address_view_body.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  List<Widget> bottomScreen = [
    const HomeShop(),
    const CategoriesShop(),
    const CartsView(),
    const FavoritesView(),
    const AddressViewBody(),
    const SettingScreen(),
  ];
  List<String> titleAppBar = ["home", "categories", "carts", "favorites", "location", "Settings"];
  List<BottomNavigationBarItem> bottomNavigatioBar(context) => [
        BottomNavigationBarItem(icon: const Icon(IconBroken.Home), label: "home".tr(context)),
        BottomNavigationBarItem(
            icon: const Icon(IconBroken.Category), label: "categories".tr(context)),
        BottomNavigationBarItem(icon: const Icon(IconBroken.Bag), label: "carts".tr(context)),
        BottomNavigationBarItem(icon: const Icon(Icons.favorite_outline), label: "fav".tr(context)),
        BottomNavigationBarItem(
            icon: const Icon(IconBroken.Location), label: "address".tr(context)),
        BottomNavigationBarItem(
            icon: const Icon(IconBroken.Setting), label: "settings".tr(context)),
      ];
  void changeBottomScreen(int index) {
    currentIndex = index;
    emit(HomeBottomNavigatorBarChangeState());
  }
}
