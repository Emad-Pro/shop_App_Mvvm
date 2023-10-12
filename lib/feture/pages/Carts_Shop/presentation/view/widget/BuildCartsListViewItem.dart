import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:number_selection/number_selection.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import '../../../../../../core/enum.dart';
import '../../../data/model/cart_model/carts_model/cart_item.dart';
import '../../view_model/bloc/carts_bloc.dart';

class BuildCartsListViewItem extends StatelessWidget {
  const BuildCartsListViewItem({Key? key, required this.productItem, required this.state})
      : super(key: key);
  final CartItem productItem;
  final CartsState state;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: FadeInUp(
        duration: const Duration(seconds: 1),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.010),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                        child: CachedNetworkImage(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.250,
                          fit: BoxFit.fill,
                          imageUrl: productItem.product!.image!,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.250,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      if (productItem.product!.discount != 0)
                        Banner(
                            message:
                                "${'discount'.tr(context)} ${productItem.product!.discount!} %",
                            location: BannerLocation.topStart),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.500,
                        child: Text(
                          productItem.product!.name!,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "${"price".tr(context).toUpperCase()} : ${productItem.product!.price.toString()} ${'EGP'.tr(context)}",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.030,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          if (productItem.product!.discount != 0)
                            Text(
                              " ${productItem.product!.oldPrice.toString()}",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: MediaQuery.of(context).size.width * 0.030,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough),
                            ),
                        ],
                      ),
                      Text(
                        "${'count'.tr(context)} :${productItem.quantity}  ",
                        maxLines: 1,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 209, 104, 96),
                          fontSize: MediaQuery.of(context).size.width * 0.040,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.05,
                    child: NumberSelection(
                      initialValue: productItem.quantity,
                      minValue: 1,
                      maxValue: 20,
                      direction: Axis.vertical,
                      withSpring: false,
                      onChanged: (int value) {
                        if (state.cartsRequestState == RequestState.loadedState) {
                          BlocProvider.of<CartsBloc>(context)
                              .add(CartsUpdateQuantityEvent(quantity: value, id: productItem.id!));
                        }
                      },
                      enableOnOutOfConstraintsAnimation: true,
                      onOutOfConstraints: () {},
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  BlocProvider.of<CartsBloc>(context)
                      .add(CartsModifiyProductEvent(id: productItem.product!.id!));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
