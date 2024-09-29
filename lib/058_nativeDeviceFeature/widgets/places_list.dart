import 'package:flutter/material.dart';

import 'package:my_app/models/place.dart';
import 'package:my_app/screens/place_detail.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;

  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No Places added yet.",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(
            radius: 40,
            backgroundImage: FileImage(places[index].image),
          ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => PlaceDetailScreen(
                  place: places[index],
                ),
              ));
            }));
  }
}
