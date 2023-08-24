import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_store/features/products/data/product_repository.dart';

class ProductDetailsPage extends ConsumerWidget {
  final int productId;
  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(fetchProductByIdProvider(productId));
    return Scaffold(
      appBar: AppBar(title: Text("Produto $productId")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: productAsync.when(
          data: (post) => Column(
            children: [
              Image.network(post.image),
              const SizedBox(height: 16),
              Text(post.title),
              const SizedBox(height: 8),
              Text(post.description)
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text(e.toString())),
        ),
      ),
    );
  }
}
