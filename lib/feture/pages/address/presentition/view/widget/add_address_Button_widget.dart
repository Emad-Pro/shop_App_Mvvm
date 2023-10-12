import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/feture/home/view_model/cubit/home_cubit.dart';

import 'Bottom_Sheet_AddAddress_widget.dart';

class AddAddressButtonWidget extends StatelessWidget {
  const AddAddressButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: SizedBox(
        child: BottomSheetAddAddress(),
      ),
    );
  }
}
