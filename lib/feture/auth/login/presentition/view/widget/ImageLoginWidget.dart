import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/asset/assets_text.dart';

class ImageLoginWidget extends StatelessWidget {
  const ImageLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        alignment: Alignment.center,
        image: const AssetImage(AssetsString.loginImage),
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}
