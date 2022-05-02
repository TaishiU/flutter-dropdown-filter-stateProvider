class Product {
  Product({
    required this.name,
    required this.price,
    required this.createdAt,
  });

  final String name;
  final int price;
  final DateTime createdAt;
}
