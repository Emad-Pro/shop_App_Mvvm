import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shimmer/shimmer.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/feture/pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import 'package:shop_app_mvvm/feture/pages/Favorites_Shop/data/model/favorites_model/datum.dart';

import '../../../../Home_Shop/presentition/view/widget/build_product_details.dart';
import '../../../../Home_Shop/presentition/view_model/bloc/home_shop_bloc.dart';
import '../../view_model/bloc/favorites_bloc.dart';

class BuildGridViewItem extends StatelessWidget {
  const BuildGridViewItem({Key? key, required this.productItem}) : super(key: key);
  final Datum productItem;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => BuildProductDetails(
                  id: productItem.product!.id!,
                ));
      },
      child: Card(
        elevation: 20,
        child: FadeInUp(
          duration: const Duration(seconds: 1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.fill,
                      imageUrl: productItem.product!.image!,
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
                  child: Text(
                    productItem.product!.name!,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            BlocProvider.of<FavoritesBloc>(context)
                                .add(ModifyFavoritesEvent(productItem.product!.id!));
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: MediaQuery.of(context).size.width * 0.08,
                          )),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<CartsBloc>(context)
                              .add(CartsModifiyProductEvent(id: productItem.product!.id!));
                        },
                        child: Icon(
                            carts![productItem.product!.id!] == true
                                ? CupertinoIcons.cart_fill_badge_minus
                                : CupertinoIcons.cart_fill_badge_plus,
                            color: carts![productItem.product!.id!] == true
                                ? Colors.deepOrangeAccent
                                : null,
                            size: MediaQuery.of(context).size.width * 0.08),
                      ),
                      const Spacer(),
                      Text(
                        "${'EGP'.tr(context)} ${productItem.product!.price!.round().toString()}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
