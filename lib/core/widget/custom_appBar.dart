import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/presentation/view_model/bloc/categories_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view_model/bloc/address_bloc.dart';

import '../../feture/pages/Home_Shop/presentition/view/widget/build_item_Crousel_Slider.dart';
import '../../feture/pages/Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';
import '../AppLocalizations/app_localizations.dart';
import '../appBar/Invisible_Expanded_Header.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, this.state, required this.useCarousel, this.title, this.offlineMode = false})
      : super(key: key);
  final HomeShopState? state;
  final bool useCarousel;
  final String? title;
  final bool offlineMode;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: useCarousel == true ? MediaQuery.of(context).size.height * 0.4 : null,
      title: useCarousel == true
          ? InvisibleExpandedHeader(
              child: Text(
              title!,
            ))
          : null,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: Wrap(
            children: [
              AppBar(
                title: Text(
                  "${"welcome".tr(context).toUpperCase()} ${UserData.userName}",
                  style: TextStyle(fontSize: 18 * MediaQuery.textScaleFactorOf(context)),
                ),
              ),
              if (offlineMode == true)
                Container(
                  width: double.infinity,
                  color: Colors.red,
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text("Offline mode".tr(context)),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CategoriesBloc>(context)
                                .add(const GetCategoriesProductEvent(true));
                            BlocProvider.of<CartsBloc>(context).add(CartsGetDataEvent(true));
                            BlocProvider.of<FavoritesBloc>(context)
                                .add(GetFavoritesDataEvent(true));
                            BlocProvider.of<AddressBloc>(context)
                                .add(const GetAddressEvent(isReload: true));
                            BlocProvider.of<HomeShopBloc>(context)
                                .add(GetHomeProductDataEvent(true));
                            BlocProvider.of<HomeShopBloc>(context)
                                .add(GetHomeProductDataEventOffline());
                          },
                          child: Text("tryAgain".tr(context)))
                    ],
                  ),
                ),
              if (useCarousel == true)
                CarouselSlider.builder(
                    itemCount: state!.homeProductModel!.data!.banners!.length,
                    itemBuilder: (context, index, realIndex) {
                      final product = state!.homeProductModel!.data!;
                      return BuildCarouselSliderWidget(urlImage: product.banners![index].image!);
                    },
                    options: CarouselOptions(
                      aspectRatio: 2,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      pageSnapping: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
