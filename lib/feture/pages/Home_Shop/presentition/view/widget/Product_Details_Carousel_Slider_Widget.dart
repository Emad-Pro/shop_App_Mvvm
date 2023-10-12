import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../product_details/presentaiton/view_model/bloc/product_details_bloc.dart';
import 'build_item_Crousel_Slider.dart';

class ProductDetailsCarouselSliderWidget extends StatelessWidget {
  const ProductDetailsCarouselSliderWidget({super.key, required this.state});
  final ProductDetailsState state;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: state.productDetailsModel!.data!.images!.length,
        itemBuilder: (context, index, realIndex) {
          return BuildCarouselSliderWidget(
            urlImage: state.productDetailsModel!.data!.images![index],
          );
        },
        options: CarouselOptions(
          aspectRatio: 2,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          pageSnapping: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}
