import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_store/api/api_error.dart';
import 'package:riverpod_store/api/dio_provider.dart';
import 'package:riverpod_store/features/products/domain/entities/product.dart';

part 'product_repository.g.dart';

class ProductRepository {
  ProductRepository({required this.dio});
  final Dio dio;

  Future<List<Product>> fetchProducts({CancelToken? cancelToken}) => _run(
        request: () => dio.get(
          'https://fakestoreapi.com/products',
          cancelToken: cancelToken,
        ),
        parse: (data) {
          final products = data as List<dynamic>;
          return products.map((product) => Product.fromJson(product)).toList();
        },
      );

  Future<Product> fetchProductById(int id, {CancelToken? cancelToken}) => _run(
        request: () => dio.get(
          'https://fakestoreapi.com/products/$id',
          cancelToken: cancelToken,
        ),
        parse: (data) => Product.fromJson(data),
      );

  Future<T> _run<T>({
    required Future<Response> Function() request,
    required T Function(dynamic) parse,
  }) async {
    try {
      final response = await request();
      switch (response.statusCode) {
        case 200:
          return parse(response.data);
        case 404:
          throw const APIError.notFound();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }
}

@Riverpod(keepAlive: true)
ProductRepository productsRepository(ProductsRepositoryRef ref) {
  return ProductRepository(dio: ref.watch(dioProvider));
}

@riverpod
Future<List<Product>> fetchProducts(FetchProductsRef ref) {
  return ref.watch(productsRepositoryProvider).fetchProducts();
}

@riverpod
Future<Product> fetchProductById(FetchProductByIdRef ref, int productId) {
  final link = ref.keepAlive();
  Timer? timer;
  final cancelToken = CancelToken();

  ref.onDispose(() {
    timer?.cancel();
    cancelToken.cancel();
  });

  ref.onCancel(() {
    // start a 30 second timer
    timer = Timer(const Duration(seconds: 5), () {
      // dispose on timeout
      link.close();
    });
  });
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
  });
  return ref
      .watch(productsRepositoryProvider)
      .fetchProductById(productId, cancelToken: cancelToken);
}
