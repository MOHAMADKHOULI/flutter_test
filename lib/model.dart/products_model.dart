class ProductModel {
  String description;
  String title;
  String brand;
  ProductModel({
    required this.description,
    required this.title,
    required this.brand,
  });
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      description: map['description'],
      title: map['title'],
      brand: map['brand'],
    );
  }
}
