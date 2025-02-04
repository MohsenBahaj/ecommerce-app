class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  // Convert Firestore snapshot to BannerModel
  factory BannerModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return BannerModel(
      imageUrl: snapshot['imageUrl'] ?? '',
      targetScreen: snapshot['targetScreen'] ?? '',
      active: snapshot['active'] ?? false,
    );
  }

  // Convert BannerModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }
}
