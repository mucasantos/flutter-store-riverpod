import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_store/features/products/domain/entities/product.dart';
import 'package:riverpod_store/features/products/domain/usecases/get_products.dart';
import 'package:riverpod_store/features/products/domain/usecases/get_product_by_id.dart';

// Provider para a lista de produtos
final productsProvider = FutureProvider<List<Product>>((ref) async {
  final getProducts = ref.watch(getProductsUseCaseProvider);
  return await getProducts();
});

// Provider para um produto específico por ID
final productByIdProvider = FutureProvider.family<Product, int>((ref, id) async {
  final getProductById = ref.watch(getProductByIdUseCaseProvider);
  return await getProductById(id);
});

// Exportar os providers para uso em outras partes do app
final productProviders = [
  productsProvider,
  productByIdProvider,
];
