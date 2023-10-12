import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/address_model/datum.dart';
import '../../view_model/bloc/address_bloc.dart';
import 'Build_Address_ListTile.dart';
import 'Build_Background_Dismissible_Widget.dart';
import 'Build_Background_Secondary_Dismissible_Widget.dart';
import 'Build_Edit_Address.dart';

class BuildDismissibleAddressWidget extends StatelessWidget {
  const BuildDismissibleAddressWidget({
    super.key,
    required this.data,
  });

  final DataAddress? data;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        confirmDismiss: (direction) async {
          if (direction.index == 3) {
            BlocProvider.of<AddressBloc>(context).add(DeleteAddressEvent(data!.id!));
            return true;
          } else if (direction.index == 2) {
            showBottomSheet(
              context: context,
              builder: (context) => BuildEditAddress(
                data: data,
              ),
            );
            return false;
          }
          return null;
        },
        background: const BuildBackgroundDismissibleWidget(),
        secondaryBackground: const BuildBackgroundSecondaryDismissibleWidget(),
        key: UniqueKey(),
        child: BuildAddressListTile(
          data: data,
        ));
  }
}
