import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/presentation/view_model/bloc/categories_bloc.dart';

import '../../../../../core/enum.dart';
import '../../../../../core/get_it/service_locator.dart';
import '../../../../../core/leistener.dart';
import '../../../../../core/widget/custom_Erorr_widget.dart';
import '../../../../../core/widget/custom_loading.dart';
import '../../../Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import '../../../Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import '../../../Home_Shop/presentition/view/widget/Build_GridView_Product_Widget.dart';

class CategoritesDetails extends StatelessWidget {
  const CategoritesDetails({Key? key, required this.id, required this.titleName}) : super(key: key);
  final int id;
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleName),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  getIt<CategoriesBloc>()..add(GetCategoriesProductDetailsEvent(id, false))),
          BlocProvider(
              create: (context) => getIt<FavoritesBloc>()..add(GetFavoritesDataEvent(false))),
          BlocProvider(create: (context) => getIt<CartsBloc>()..add(CartsGetDataEvent(false))),
        ],
        child: MultiBlocListener(
          listeners: [listenerFavoritesMethod(), listenerCartsMethod()],
          child: Builder(
            builder: (context) {
              context.select((CartsBloc bloc) => bloc.state);
              context.select((FavoritesBloc bloc) => bloc.state);
              CategoriesState categoriesState = context.select((CategoriesBloc bloc) => bloc.state);
              switch (categoriesState.categoriesDetailsState) {
                case RequestState.loadingState:
                  return const LoadingWidget();
                case RequestState.loadedState:
                  return CustomScrollView(
                    slivers: [
                      BuildGridViewProductWidget(
                        products: categoriesState.categoriesDetailsProduct,
                      )
                    ],
                  );
                case RequestState.erorrState:
                  return CustomErorrWidget(
                    erorrMessage: categoriesState.categoriesDetailsErorrMessage.tr(context),
                    onPressd: () {
                      BlocProvider.of<CategoriesBloc>(context)
                          .add(GetCategoriesProductDetailsEvent(id, true));
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
