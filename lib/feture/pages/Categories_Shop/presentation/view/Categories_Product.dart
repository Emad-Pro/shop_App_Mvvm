import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/core/widget/custom_loading.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/presentation/view/widget/Categories_GridView.dart';
import 'package:shop_app_mvvm/feture/pages/Categories_Shop/presentation/view_model/bloc/categories_bloc.dart';

import '../../../../../../../../core/enum.dart';
import '../../../../../core/widget/custom_Erorr_widget.dart';

class CategoriesShop extends StatelessWidget {
  const CategoriesShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        switch (state.categoriesState) {
          case RequestState.loadingState:
            return const LoadingWidget();
          case RequestState.loadedState:
            return CustomScrollView(
              slivers: [
                CategoriesGridView(
                  productCategoriesList: state.categoriesProductModel!.data!.data!,
                ),
              ],
            );
          case RequestState.erorrState:
            return CustomErorrWidget(
              erorrMessage: state.categoriesMessage.tr(context),
              onPressd: () {
                BlocProvider.of<CategoriesBloc>(context).add(const GetCategoriesProductEvent(true));
              },
            );
        }
      },
    );
  }
}
