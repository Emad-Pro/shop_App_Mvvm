import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/feture/pages/address/presentition/view/widget/build_address_item.dart';

import '../../view_model/bloc/address_bloc.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.state});
  final AddressState state;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return BuildAddressItem(
              data: state.getAddressModel!.data!.data![index],
            );
          },
          itemCount: state.getAddressModel!.data!.data!.length,
        ))
      ],
    );
  }
}
