import 'package:flutter/material.dart';

import '../../../data/model/address_model/datum.dart';

import 'Build_Dismissible_Address_Widget.dart';

class BuildAddressItem extends StatelessWidget {
  const BuildAddressItem({Key? key, required this.data}) : super(key: key);
  final DataAddress? data;
  @override
  Widget build(BuildContext context) {
    return BuildDismissibleAddressWidget(data: data);
  }
}
