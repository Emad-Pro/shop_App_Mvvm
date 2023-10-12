import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_Erorr_widget.dart';
import '../../../../../../core/enum.dart';
import '../../../../../../core/get_it/service_locator.dart';
import '../../../../../../core/widget/custom_loading.dart';
import '../../../../../product_details/presentaiton/view_model/bloc/product_details_bloc.dart';
import 'Build_Product_Details_Item.dart';

class BuildProductDetails extends StatelessWidget {
  const BuildProductDetails({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(getIt())..add(ProductDetailsEvent(id)),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          switch (state.productDetailsState) {
            case RequestState.loadingState:
              return const LoadingWidget();
            case RequestState.loadedState:
              return BuildProductDetailsItem(state: state);
            case RequestState.erorrState:
              return CustomErorrWidget(
                erorrMessage: state.productDetailsMessage.tr(context),
                onPressd: () {
                  BlocProvider.of<ProductDetailsBloc>(context).add(ProductDetailsEvent(id));
                },
              );
          }
        },
      ),
    );
  }
}
