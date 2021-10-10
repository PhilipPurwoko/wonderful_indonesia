import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wonderful_indonesia/models/attraction_model.dart';
import 'package:wonderful_indonesia/provider/auth_provider.dart';
import 'package:wonderful_indonesia/repository/attraction_repository.dart';
import 'package:wonderful_indonesia/ui/widgets/AttractionCardWidget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wonderful Indonesia'),
        actions: <Widget>[
          Text(authProvider.user.name),
          IconButton(
            onPressed: () => authProvider.logout(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: StreamBuilder<List<AttractionModel>>(
        stream: AttractionRepostitory().attractions,
        builder: (
          BuildContext _,
          AsyncSnapshot<List<AttractionModel>> snapshot,
        ) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((AttractionModel attraction) =>
                      AttractionCard(attraction))
                  .toList(),
            );
          }
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
