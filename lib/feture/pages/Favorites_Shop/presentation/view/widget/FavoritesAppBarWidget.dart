import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import '../../../../../../core/appBar/Invisible_Expanded_Header.dart';

class FavoritesAppBarWidget extends StatelessWidget {
  const FavoritesAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      title: InvisibleExpandedHeader(
          child: Text(
        "favorite".tr(context).toUpperCase(),
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
      )),
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(seconds: 5),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/favorites/image/1.png"))),
          ),
        ),
      ),
    );
  }
}
