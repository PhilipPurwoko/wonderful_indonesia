import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_indonesia/constant.dart';
import 'package:wonderful_indonesia/models/attraction/attraction_model.dart';

class AttractionCard extends StatelessWidget {
  const AttractionCard(
    this.attraction, {
    Key? key,
  }) : super(key: key);

  final AttractionModel attraction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Get.toNamed(RouteName.detail, arguments: attraction),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.attractions),
              title: Text(attraction.name),
              subtitle: Text(
                attraction.address,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
            ),
            Image.network(attraction.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(attraction.description),
            ),
          ],
        ),
      ),
    );
  }
}
