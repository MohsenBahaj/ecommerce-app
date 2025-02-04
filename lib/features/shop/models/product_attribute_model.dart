class ProductAttributeModel {
  String name;
  List<String> values;

  ProductAttributeModel({required this.name, required this.values});

  factory ProductAttributeModel.fromMap(Map<String, dynamic> map) {
    // Convert each key-value pair into a separate ProductAttributeModel
    return map.entries.map((entry) {
      return ProductAttributeModel(
        name: entry.key,
        values: List<String>.from(entry.value ?? []),
      );
    }).first; // Pick only the first entry from each map
  }
}
