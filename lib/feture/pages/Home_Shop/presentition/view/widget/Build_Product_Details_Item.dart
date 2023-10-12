import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import '../../../../../product_details/presentaiton/view_model/bloc/product_details_bloc.dart';
import '../../view_model/bloc/home_shop_bloc.dart';
import 'Product_Details_Carousel_Slider_Widget.dart';
import 'build_item_Crousel_Slider.dart';

class BuildProductDetailsItem extends StatelessWidget {
  const BuildProductDetailsItem({super.key, required this.state});
  final ProductDetailsState state;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          AppBar(title: Text(state.productDetailsModel!.data!.name!), actions: [
            Icon(
              Icons.favorite,
              color: favorites![state.productDetailsModel!.data!.id!] == true
                  ? Colors.pink
                  : Colors.black,
            ),
          ]),
          Expanded(
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Wrap(
                  children: [
                    FadeInDown(
                      child: Center(
                        child: BuildCarouselSliderWidget(
                            width: MediaQuery.of(context).size.width * 0.6,
                            urlImage: state.productDetailsModel!.data!.image!),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.productDetailsModel!.data!.name!,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          ProductDetailsCarouselSliderWidget(state: state),
                          Text(
                            'details'.tr(context).toUpperCase(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            state.productDetailsModel!.data!.description!,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      );
    });
  }
}
