import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/feture/order/presentation/view/widget/ProductCard.dart';
import '../../../data/model/order_details_model/product.dart';

class OrderDetailsProductListView extends StatelessWidget {
  const OrderDetailsProductListView({Key? key, required this.products}) : super(key: key);
  final List<Product>? products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products!.length,
        itemBuilder: (context, index) {
          return ProductCard(
            title: '${products![index].name}',
            image: '${products![index].image}',
            price: 'EGP${products![index].price}',
          );
        },
      ),
    );
  }
}
