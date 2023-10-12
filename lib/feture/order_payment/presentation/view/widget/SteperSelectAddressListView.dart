import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enum.dart';
import '../../../../../core/get_it/service_locator.dart';
import '../../../../pages/address/presentition/view_model/bloc/address_bloc.dart';
import '../../view_model/cubit/payment_cubit.dart';
import 'BuildAddressItemWidget.dart';

class SteperSelectAddressListView extends StatelessWidget {
  const SteperSelectAddressListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressBloc(getIt())..add(GetAddressEvent(isReload: false)),
      child: SizedBox(
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            switch (state.getAddressState) {
              case RequestState.loadingState:
                return const LinearProgressIndicator();
              case RequestState.loadedState:
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                      itemCount: state.getAddressModel!.data!.data!.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              PaymentCubit.get(context).selectAddressChangeColor(
                                  state.getAddressModel!.data!.data![index].id!,
                                  state.getAddressModel!.data!.data![index]);
                            },
                            child: BlocBuilder<PaymentCubit, PaymentState>(
                              builder: (context, state1) {
                                return BuildAddressItem(
                                    state: state.getAddressModel!.data!.data![index]);
                              },
                            ),
                          )),
                );
              case RequestState.erorrState:
                return Text(state.getAddressMessage);
            }
          },
        ),
      ),
    );
  }
}
