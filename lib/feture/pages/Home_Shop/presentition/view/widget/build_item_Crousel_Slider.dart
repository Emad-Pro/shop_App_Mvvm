import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildCarouselSliderWidget extends StatelessWidget {
  const BuildCarouselSliderWidget(
      {super.key, required this.urlImage, this.height, this.width});
  final String urlImage;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      child: CachedNetworkImage(
        width: width ?? MediaQuery.of(context).size.width * 1,
        fit: BoxFit.fill,
        imageUrl: urlImage,
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
    );
  }
}
