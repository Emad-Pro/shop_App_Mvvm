import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/auth/singup/presentation/view/sinUp_view.dart';

class OtherSelectionWidget extends StatelessWidget {
  const OtherSelectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("don'tHaveAnAccount".tr(context).toUpperCase()),
        ),
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SinUpView()));
              },
              child: Text("signUpNow".tr(context))),
        ),
      ],
    );
  }
}
