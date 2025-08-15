import 'package:flutter/material.dart';
import 'package:riverpod_store/features/products/presentation/widgets/product_list.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: const ProductList(),
    );
  }
}
