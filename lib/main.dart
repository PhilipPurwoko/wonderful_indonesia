import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:wonderful_indonesia/provider/auth_provider.dart';
import 'package:wonderful_indonesia/routes.dart';
import 'package:wonderful_indonesia/ui/screens/dashboard_screen.dart';
import 'package:wonderful_indonesia/ui/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<ChangeNotifier>>[
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: FutureBuilder<FirebaseApp>(
          future: _initialization,
          builder: (BuildContext ctx, AsyncSnapshot<FirebaseApp> snapshot) {
            if (snapshot.hasData) {
              return GetMaterialApp(
                title: 'Wonderful Indonesia',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: Consumer<AuthProvider>(builder: (
                  BuildContext context,
                  AuthProvider authProvider,
                  _,
                ) {
                  return authProvider.isAuthenticated
                      ? const DashboardScreen()
                      : const LoginScreen();
                }),
                getPages: pages,
              );
            }
            if (snapshot.hasError) {
              return const Text('Error');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
