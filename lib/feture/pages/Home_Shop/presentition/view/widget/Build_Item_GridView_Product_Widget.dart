import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/presentation/view_model/bloc/favorites_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/data/model/home_product_model/product.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';

import '../../../../Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';

import 'build_product_details.dart';

class BuildItemGridViewProductWidget extends StatelessWidget {
  const BuildItemGridViewProductWidget(
      {super.key, required this.product, this.offlineMode = false});

  final Product product;
  final bool offlineMode;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.02,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => BuildProductDetails(
                      id: product.id!,
                    ));
          },
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.fill,
                    imageUrl: product.image!,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.description!,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (offlineMode == false) {
                        BlocProvider.of<FavoritesBloc>(context)
                            .add(ModifyFavoritesEvent(product.id!));
                      }
                    },
                    child: Icon(
                      favorites![product.id!] == true
                          ? CupertinoIcons.suit_heart_fill
                          : CupertinoIcons.suit_heart,
                      size: MediaQuery.of(context).size.width * 0.05,
                      color: favorites![product.id!] == true ? Colors.deepOrangeAccent : null,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        if (offlineMode == false) {
                          BlocProvider.of<CartsBloc>(context)
                              .add(CartsModifiyProductEvent(id: product.id!));
                        }
                      },
                      child: Icon(
                        carts![product.id!] == true
                            ? CupertinoIcons.cart_fill_badge_minus
                            : CupertinoIcons.cart_fill_badge_plus,
                        size: MediaQuery.of(context).size.width * 0.05,
                        color: carts![product.id!] == true ? Colors.deepOrangeAccent : null,
                      )),
                  const Spacer(),
                  Text(
                    "${"EGP".tr(context)} ${product.price!.round()} ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
