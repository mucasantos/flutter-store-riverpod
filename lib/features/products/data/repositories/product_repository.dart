import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_store/features/products/domain/entities/product.dart';
import 'package:riverpod_store/features/products/domain/repositories/product_repository.dart' as domain;

class ProductRepositoryImpl implements domain.ProductRepository {
  final Dio dio;

  ProductRepositoryImpl({required this.dio});

  @override
  Future<List<Product>> fetchProducts({CancelToken? cancelToken}) async {
    try {
      final response = await dio.get<List<dynamic>>(
        'https://fakestoreapi.com/products',
        cancelToken: cancelToken,
      );

      if (response.statusCode == 200) {
        return (response.data ?? []).map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<Product> fetchProductById(int id, {CancelToken? cancelToken}) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://fakestoreapi.com/products/$id',
        cancelToken: cancelToken,
      );

      if (response.statusCode == 200 && response.data != null) {
        return Product.fromJson(response.data!);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }
}

// Provider para o repositório
final productRepositoryProvider = Provider<domain.ProductRepository>((ref) {
  return ProductRepositoryImpl(dio: Dio());
});
