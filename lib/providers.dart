import 'package:collection/collection.dart';
import 'package:dropdown_filter_stateprovider/models/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ProductSortType {
  name,
  price,
  createdAt,
}

final products = [
  Product(
    name: 'Android',
    price: 100,
    createdAt: DateTime.now(),
  ),
  Product(
    name: 'iOS',
    price: 180,
    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),
  ),
  Product(
    name: 'Huawei',
    price: 80,
    createdAt: DateTime.now().subtract(
      const Duration(days: 2),
    ),
  ),
];

final productSortTypeProvider = StateProvider((ref) => ProductSortType.name);

final productsProvider = Provider<List<Product>>((ref) {
  final sortType = ref.watch(productSortTypeProvider);
  switch (sortType) {
    case ProductSortType.name:
      return products.sorted((a, b) => a.name.compareTo(b.name));
    case ProductSortType.price:
      return products.sorted((a, b) => a.price.compareTo(b.price));
    case ProductSortType.createdAt:
      return products.sorted((a, b) => a.createdAt.compareTo(b.createdAt));
  }
});
