import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/presentation/view_model/bloc/categories_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/presentition/view/widget/Build_GridView_Product_Widget.dart';
import 'package:shop_app_mvvm/core/customWidgets/Product_Title_Text_Widget.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view_model/bloc/address_bloc.dart';
import '../../../../../../../../core/enum.dart';
import '../../../../../core/leistener.dart';
import '../../../../../core/widget/custom_Erorr_widget.dart';
import '../../../../../core/widget/custom_appBar.dart';

class HomeShop extends StatelessWidget {
  const HomeShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          listenerFavoritesMethod(),
          listenerCartsMethod(),
        ],
        child: Builder(
          builder: (context) {
            HomeShopState homeShopState = context.select((HomeShopBloc bloc) => bloc.state);
            context.select((CartsBloc bloc) => bloc.state);
            context.select((FavoritesBloc bloc) => bloc.state);
            switch (homeShopState.homeProductState) {
              case RequestState.loadingState:
                return const CustomScrollView(
                  slivers: [
                    SliverFillRemaining(child: BuildLoadingWidgetGridView()),
                  ],
                );
              case RequestState.loadedState:
                return BuildHomeProduct(
                  homeShopState: homeShopState,
                  offlineMode: false,
                );

              case RequestState.erorrState:
                if (homeShopState.homeProductModel != null) {
                  return BuildHomeProduct(
                    homeShopState: homeShopState,
                    offlineMode: true,
                  );
                } else {
                  return CustomErorrWidget(
                    erorrMessage: homeShopState.homeProductMessage,
                    onPressd: () {
                      BlocProvider.of<CategoriesBloc>(context)
                          .add(const GetCategoriesProductEvent(true));
                      BlocProvider.of<CartsBloc>(context).add(CartsGetDataEvent(true));
                      BlocProvider.of<FavoritesBloc>(context).add(GetFavoritesDataEvent(true));
                      BlocProvider.of<AddressBloc>(context)
                          .add(const GetAddressEvent(isReload: true));

                      BlocProvider.of<HomeShopBloc>(context).add(GetHomeProductDataEvent(true));
                    },
                  );
                }
            }
          },
        ));
  }
}

class BuildLoadingWidgetGridView extends StatelessWidget {
  const BuildLoadingWidgetGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, indext) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: MediaQuery.of(context).size.width * 0.35,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 10.0,
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 10.0,
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 10.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildHomeProduct extends StatelessWidget {
  const BuildHomeProduct({super.key, required this.homeShopState, this.offlineMode = false});
  final bool offlineMode;
  final HomeShopState homeShopState;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      CustomAppBar(
        useCarousel: true,
        state: homeShopState,
        offlineMode: offlineMode,
        title: "products".tr(context),
      ),
      ProductTitleTextWidget(
        textTitle: "products".tr(context).toUpperCase(),
      ),
      BuildGridViewProductWidget(
        offlineMode: offlineMode,
        products: homeShopState.homeProductModel!.data!.products,
      ),
    ]);
  }
}
