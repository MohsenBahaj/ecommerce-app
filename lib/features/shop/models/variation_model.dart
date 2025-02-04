class ProductVariationModel {
  String id;
  String color;
  String size;
  String description;
  String image;
  double price;
  double salePrice;
  String sku;
  int stock;

  ProductVariationModel({
    required this.id,
    required this.color,
    required this.size,
    required this.description,
    required this.image,
    required this.price,
    required this.salePrice,
    required this.sku,
    required this.stock,
  });

  factory ProductVariationModel.fromMap(Map<String, dynamic> map) {
    // Convert stock safely from string or number to int.
    int parsedStock = int.tryParse(map['Stock']?.toString() ?? '') ?? 0;

    return ProductVariationModel(
      id: map['Id'] ?? '',
      color: (map['AttributeValues'] as Map<String, dynamic>)['Color'] ?? '',
      size: (map['AttributeValues'] as Map<String, dynamic>)['Size'] ?? '',
      description: map['Description'] ?? '',
      image: map['Image'] ?? '',
      // Convert price safely from string or number to double.
      price: double.tryParse(map['Price']?.toString() ?? '') ?? 0,
      salePrice: double.tryParse(map['SalePrice']?.toString() ?? '') ?? 0,
      sku: map['SKU'] ?? '',
      stock: parsedStock,
    );
  }
}
