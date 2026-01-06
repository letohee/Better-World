import 'package:flutter/material.dart';

class HoverableGalleryItem extends StatefulWidget {
  final String image;
  final String description;
  final String location;

  HoverableGalleryItem({required this.image, required this.description, required this.location});

  @override
  _HoverableGalleryItemState createState() => _HoverableGalleryItemState();
}

class _HoverableGalleryItemState extends State<HoverableGalleryItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        if (isHovered)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Text(
                  widget.location,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
        MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
        ),
      ],
    );
  }
}
