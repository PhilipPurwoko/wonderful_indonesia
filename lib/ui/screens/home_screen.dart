import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wonderful_indonesia/models/attraction_model.dart';
import 'package:wonderful_indonesia/ui/widgets/AttractionCardWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> _attractionsStream =
      FirebaseFirestore.instance.collection('attractions').snapshots();

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wonderful Indonesia'),
      ),
      body: FutureBuilder<FirebaseApp>(
          future: _initialization,
          builder: (_, AsyncSnapshot<FirebaseApp> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _attractionsStream,
                  builder: (
                    BuildContext _,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data!.docs.map(
                          (DocumentSnapshot<Map<String, dynamic>> document) {
                            Map<String, dynamic> data = document.data()!;
                            return AttractionCard(Attraction.fromJson(data));
                          },
                        ).toList(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    return const Center(child: CircularProgressIndicator());
                  });
            }
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
