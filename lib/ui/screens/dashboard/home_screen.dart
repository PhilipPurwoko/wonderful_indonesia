import 'package:flutter/material.dart';
import 'package:wonderful_indonesia/models/attraction/attraction_model.dart';
import 'package:wonderful_indonesia/repository/attraction_repository.dart';
import 'package:wonderful_indonesia/ui/widgets/AttractionCardWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AttractionModel>>(
      stream: AttractionRepostitory().attractions,
      builder: (
        BuildContext _,
        AsyncSnapshot<List<AttractionModel>> snapshot,
      ) {
        if (snapshot.hasData) {
          final List<AttractionCard> attractionCard = snapshot.data!
              .map((AttractionModel attraction) => AttractionCard(attraction))
              .toList();

          return ListView.separated(
            itemCount: attractionCard.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (_, int index) => attractionCard[index],
          );
        }
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
