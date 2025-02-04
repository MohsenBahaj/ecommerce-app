import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm/features/shop/models/BrandModel.dart';
import 'package:ecomm/features/shop/models/product_attribute_model.dart';
import 'package:ecomm/features/shop/models/variation_model.dart';

class ProductModel {
  String id;
  String stock;
  String sku;
  double price;
  String title;
  double salePrice;
  String thumbnail;
  bool isFeatured;
  BrandModel brand;
  String description;
  String categoryId;
  List<String> images;
  String productType;
  List<ProductAttributeModel> productAttributes;
  List<ProductVariationModel> productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.sku,
    required this.price,
    required this.salePrice,
    required this.thumbnail,
    required this.isFeatured,
    required this.brand,
    required this.description,
    required this.categoryId,
    required this.images,
    required this.productType,
    required this.productAttributes,
    required this.productVariations,
  });
  factory ProductModel.empty() {
    return ProductModel(
      id: '',
      title: '',
      stock: '',
      sku: '',
      price: 0,
      salePrice: 0,
      thumbnail: '',
      isFeatured: false,
      // Make sure to create an empty BrandModel as well.
      brand: BrandModel.empty(),
      description: '',
      categoryId: '',
      images: [],
      productType: '',
      productAttributes: [],
      productVariations: [],
    );
  }
  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>? ?? {};
    return ProductModel(
      id: snapshot.id,
      title: data['Title'] ?? '',
      stock: data['stock'] ?? "0",
      sku: data['SKU'] ?? '',
      // Convert price safely from string or number to double.
      price: double.tryParse(data['Price']?.toString() ?? '') ?? 0,
      // Convert salePrice safely.
      salePrice: double.tryParse(data['SalePrice']?.toString() ?? '') ?? 0,
      thumbnail: data['Thumbnail'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      // Use fromMap to convert the Brand map.
      brand: BrandModel.fromMap(
        data['Brand']?['Id'] ?? '',
        data['Brand'] as Map<String, dynamic>? ?? {},
      ),
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: List<String>.from(data['Images'] ?? []),
      productType: data['ProductType'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>?)
              ?.expand((attributeMap) => (attributeMap as Map<String, dynamic>)
                  .entries
                  .map((entry) => ProductAttributeModel(
                      name: entry.key,
                      values: List<String>.from(entry.value ?? []))))
              .toList() ??
          [],

      productVariations: (data['ProductVariations'] as List<dynamic>?)
              ?.map((e) =>
                  ProductVariationModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
