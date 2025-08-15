import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_store/features/products/domain/entities/product.dart';
import 'package:riverpod_store/features/products/domain/repositories/product_repository.dart';
import 'package:riverpod_store/features/products/data/repositories/product_repository.dart' as impl;

// Definição do caso de uso
class GetProductById {
  final ProductRepository repository;
  
  GetProductById(this.repository);
  
  Future<Product> call(int id, {CancelToken? cancelToken}) async {
    return await repository.fetchProductById(id, cancelToken: cancelToken);
  }
}

// Provider para o caso de uso
final getProductByIdUseCaseProvider = Provider<GetProductById>((ref) {
  final repository = ref.watch(impl.productRepositoryProvider);
  return GetProductById(repository);
});
