import 'package:riverpod_store/features/products/domain/entities/product.dart';
import 'package:dio/dio.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts({CancelToken? cancelToken});
  Future<Product> fetchProductById(int id, {CancelToken? cancelToken});
}
