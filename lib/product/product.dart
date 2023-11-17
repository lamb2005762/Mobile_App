class Product {
  final String id;
  final String name;
  final double salePrice;
  final double regularPrice;
  final String imageUrl;
  int quantity;
  double totalPrice; // Thêm thuộc tính totalPrice

  Product({
    required this.id,
    required this.name,
    required this.salePrice,
    required this.regularPrice,
    required this.imageUrl,
    this.quantity = 1,
    this.totalPrice = 0.0, // Khởi tạo totalPrice
  });
}
