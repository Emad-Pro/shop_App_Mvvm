// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProductTitleTextWidget extends StatelessWidget {
  const ProductTitleTextWidget({
    super.key,
    required this.textTitle,
  });
  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20, top: 20),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(25), topEnd: Radius.circular(25))),
            child: Center(
              child: Text(
                textTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
