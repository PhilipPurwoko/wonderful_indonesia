import 'package:flutter/material.dart';
import 'package:wonderful_indonesia/models/attraction_model.dart';

class AttractionCard extends StatelessWidget {
  const AttractionCard(
    this.attraction, {
    Key? key,
  }) : super(key: key);

  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(attraction.name),
        ),
        child: GestureDetector(
          child: Image.network(attraction.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
