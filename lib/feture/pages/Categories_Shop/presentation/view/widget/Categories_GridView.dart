import 'package:flutter/material.dart';

import '../../../data/model/categories_product/datum.dart';

import 'Build_Item_Categories_GridView.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.productCategoriesList});
  final List<Datum>? productCategoriesList;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: productCategoriesList!.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
        ),
        itemBuilder: (context, index) {
          return BuildItemCategoriesGridView(
              productCategories: productCategoriesList![index]);
        });
  }
}
