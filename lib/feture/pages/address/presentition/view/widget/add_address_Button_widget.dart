import 'package:flutter/material.dart';
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
