// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsRepositoryHash() =>
    r'4f31a14dd59217568001d22185bc764262044dfe';

/// See also [productsRepository].
@ProviderFor(productsRepository)
final productsRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$fetchProductsHash() => r'46b4a7889c4022f3f2719f670bdecb71cfb6b550';

/// See also [fetchProducts].
@ProviderFor(fetchProducts)
final fetchProductsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  fetchProducts,
  name: r'fetchProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$fetchProductByIdHash() => r'959231a0ba32a58f7f992eedd19f83666bff84a4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchProductByIdRef = AutoDisposeFutureProviderRef<Product>;

/// See also [fetchProductById].
@ProviderFor(fetchProductById)
const fetchProductByIdProvider = FetchProductByIdFamily();

/// See also [fetchProductById].
class FetchProductByIdFamily extends Family<AsyncValue<Product>> {
  /// See also [fetchProductById].
  const FetchProductByIdFamily();

  /// See also [fetchProductById].
  FetchProductByIdProvider call(
    int productId,
  ) {
    return FetchProductByIdProvider(
      productId,
    );
  }

  @override
  FetchProductByIdProvider getProviderOverride(
    covariant FetchProductByIdProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchProductByIdProvider';
}

/// See also [fetchProductById].
class FetchProductByIdProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [fetchProductById].
  FetchProductByIdProvider(
    this.productId,
  ) : super.internal(
          (ref) => fetchProductById(
            ref,
            productId,
          ),
          from: fetchProductByIdProvider,
          name: r'fetchProductByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductByIdHash,
          dependencies: FetchProductByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchProductByIdFamily._allTransitiveDependencies,
        );

  final int productId;

  @override
  bool operator ==(Object other) {
    return other is FetchProductByIdProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
