import 'package:flutter/material.dart';
import '../../../../../../core/widget/custom_loading.dart';
import '../../view_model/bloc/carts_bloc.dart';

class LoadingCartWidget extends StatelessWidget {
  const LoadingCartWidget({super.key, required this.state});
  final CartsState state;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverFillRemaining(child: LoadingWidget()),
      ],
    );
  }
}
