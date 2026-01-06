import 'package:flutter/material.dart';
import '../widgets/hoverable_gallery_item.dart';

class GalleryPage extends StatelessWidget {
  final List<Map<String, String>> galleryItems = [
    {'image': 'assets/pal.jpg', 'description': '12.12.2024', 'location': 'Sudan'},
    {'image': 'assets/af.jpg', 'description': '31.06.2024', 'location': 'Nigeria'},
    {'image': 'assets/af2.jpg', 'description': '22.05.2024', 'location': 'Palestine'},
    {'image': 'assets/sahel.jpg', 'description': '01.12.2025', 'location': 'Sahara'},
    {'image': 'assets/la.jpg', 'description': '20.11.2024', 'location': 'LA'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: galleryItems.length,
          itemBuilder: (context, index) {
            return HoverableGalleryItem(
              image: galleryItems[index]['image']!,
              description: galleryItems[index]['description']!,
              location: galleryItems[index]['location']!,
            );
          },
        ),
      ),
    );
  }
}
