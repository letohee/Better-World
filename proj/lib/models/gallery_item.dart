class GalleryItem {
  final String image;
  final String description;
  final String location;

  GalleryItem({required this.image, required this.description, required this.location});

  // Factory constructor to create a GalleryItem from a Map (useful for Firestore)
  factory GalleryItem.fromMap(Map<String, dynamic> data) {
    return GalleryItem(
      image: data['image'] ?? '',
      description: data['description'] ?? '',
      location: data['location'] ?? '',
    );
  }

  // Convert GalleryItem object to a Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'description': description,
      'location': location,
    };
  }
}
