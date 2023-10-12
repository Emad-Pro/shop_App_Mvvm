import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_loading.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view/widget/FavoritesAppBarWidget.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view/widget/FavoritesGridView.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import '../../../../../../../core/customWidgets/Product_Title_Text_Widget.dart';
import '../../../../../../../core/enum.dart';
import '../../../../../core/leistener.dart';
import '../../../../../core/widget/custom_Erorr_widget.dart';
import '../../../Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [listenerFavoritesMethod(), listenerCartsMethod()],
        child: Builder(
          builder: (context) {
            context.select((CartsBloc bloc) => bloc.state);
            FavoritesState favoritesState = context.select((FavoritesBloc bloc) => bloc.state);

            switch (favoritesState.favoritesState) {
              case RequestState.loadingState:
                return const CustomScrollView(
                  slivers: [
                    SliverFillRemaining(child: LoadingWidget()),
                  ],
                );
              case RequestState.loadedState:
                return CustomScrollView(
                  slivers: [
                    const FavoritesAppBarWidget(),
                    ProductTitleTextWidget(
                      textTitle: 'favorite'.tr(context).toUpperCase(),
                    ),
                    favoritesState.favoritesModel!.data!.data!.isEmpty
                        ? SliverFillRemaining(
                            child: Center(
                                child: Text("theFavoritesIsEmpty".tr(context).toUpperCase())))
                        : FavoritesGridView(
                            state: favoritesState,
                          )
                  ],
                );
              case RequestState.erorrState:
                return CustomErorrWidget(
                  erorrMessage: favoritesState.erorrMessage.tr(context),
                  onPressd: () {
                    BlocProvider.of<FavoritesBloc>(context).add(GetFavoritesDataEvent(true));
                  },
                );
            }
          },
        ));
  }
}
