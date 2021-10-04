import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wonderful_indonesia/ui/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: _initialization,
        builder: (BuildContext ctx, AsyncSnapshot<FirebaseApp> snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Wonderful Indonesia',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const HomeScreen(),
            );
          }
          if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
