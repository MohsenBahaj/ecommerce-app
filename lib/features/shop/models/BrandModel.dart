import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  int productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.productsCount,
  });

  // For DocumentSnapshot
  factory BrandModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return BrandModel.fromMap(snapshot.id, data);
  }

  // For Map conversion
  factory BrandModel.fromMap(String id, Map<String, dynamic> map) {
    return BrandModel(
      id: id,
      name: map['Name'] ?? '',
      image: map['Image'] ?? '',
      isFeatured: map['IsFeatured'] ?? false,
      productsCount: map['ProductsCount'] ?? 0,
    );
  }
  factory BrandModel.empty() {
    return BrandModel(
      id: '',
      name: '',
      image: '',
      isFeatured: false,
      productsCount: 0,
    );
  }
}
