import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/presentation/view/widget/LoadingWidget.dart';
import '../../../../../core/enum.dart';
import '../../../../../core/widget/custom_Erorr_widget.dart';
import '../view_model/bloc/carts_bloc.dart';
import 'cart_view_body.dart';
import 'method/cartsListnerState.dart';

class CartsView extends StatelessWidget {
  const CartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartsBloc, CartsState>(
      listener: (context, state) {
        cartsListenerState(state, context);
      },
      builder: (context, state) {
        switch (state.cartsRequestState) {
          case RequestState.loadingState:
            return LoadingCartWidget(state: state);
          case RequestState.loadedState:
            return CartsViewBody(state: state);
          case RequestState.erorrState:
            return CustomErorrWidget(
              erorrMessage: state.cartsErorrMessage.tr(context),
              onPressd: () {
                BlocProvider.of<CartsBloc>(context).add(CartsGetDataEvent(true));
              },
            );
        }
      },
    );
  }
}
