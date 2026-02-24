class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl; // ← ganti dari emoji
  final String description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
  });
}
