import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_indonesia/models/attraction_model.dart';
import 'package:wonderful_indonesia/routes.dart';

class AttractionCard extends StatelessWidget {
  const AttractionCard(
    this.attraction, {
    Key? key,
  }) : super(key: key);

  final AttractionModel attraction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteName.detail, arguments: attraction),
      child: ListTile(
        title: Text(attraction.name),
        subtitle: Text(attraction.address),
        leading: Image.network(attraction.imageUrl),
        isThreeLine: true,
      ),
    );
  }
}
