import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_indonesia/models/attraction/attraction_model.dart';
// import 'package:wonderful_indonesia/models/attraction_model.dart';

class AttractionDetail extends StatelessWidget {
  AttractionDetail({Key? key}) : super(key: key);
  final AttractionModel attraction = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              attraction.imageUrl,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
