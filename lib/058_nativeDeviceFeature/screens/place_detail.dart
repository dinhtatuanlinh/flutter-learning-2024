import 'package:flutter/material.dart';
import 'package:my_app/models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Center(
        child: Stack(
          children: [
            Image.file(place.image, fit: BoxFit.cover, width: double.infinity, height: double.infinity,)
          ],
        ),
      ),
    );
  }
}
