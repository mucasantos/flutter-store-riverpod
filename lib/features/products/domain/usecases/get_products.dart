import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_store/features/products/domain/entities/product.dart';
import 'package:riverpod_store/features/products/domain/repositories/product_repository.dart';
import 'package:riverpod_store/features/products/data/repositories/product_repository.dart' as impl;

// Definição do caso de uso
class GetProducts {
  final ProductRepository repository;
  
  GetProducts(this.repository);
  
  Future<List<Product>> call({CancelToken? cancelToken}) async {
    return await repository.fetchProducts(cancelToken: cancelToken);
  }
}

// Provider para o caso de uso
final getProductsUseCaseProvider = Provider<GetProducts>((ref) {
  final repository = ref.watch(impl.productRepositoryProvider);
  return GetProducts(repository);
});
