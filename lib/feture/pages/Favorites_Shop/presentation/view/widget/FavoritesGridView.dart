import 'package:flutter/material.dart';

import '../../view_model/bloc/favorites_bloc.dart';
import 'BuildGridViewItem.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({
    super.key,
    required this.state,
  });
  final FavoritesState state;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.02,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return BuildGridViewItem(
                productItem: state.favoritesModel!.data!.data![index]);
          },
          childCount: state.favoritesModel!.data!.data!.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 7.0,
          crossAxisSpacing: 7.0,
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
