import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:riverpod_store/features/products/data/product_repository.dart';
import 'package:riverpod_store/features/products/presentation/widgets/product_tile.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(fetchProductsProvider);
    return productAsync.when(
      data: (products) => GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 2,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [const QuiltedGridTile(1, 1)],
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          final product = products[index];
          return ProductTile(
            productId: product.id,
            title: product.title,
            price: product.price.toString(),
            image: product.image,
          );
        }),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text(e.toString())),
    );
  }
}
