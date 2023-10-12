import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/data/model/home_product_model/product.dart';
import 'package:shop_app_mvvm/feture/pages/Home_Shop/presentition/view/widget/Build_Item_GridView_Product_Widget.dart';

class BuildGridViewProductWidget extends StatelessWidget {
  const BuildGridViewProductWidget({super.key, required this.products, this.offlineMode = false});
  final List<Product>? products;
  final bool offlineMode;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return BuildItemGridViewProductWidget(
                product: products![index], offlineMode: offlineMode);
          },
          childCount: products!.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
