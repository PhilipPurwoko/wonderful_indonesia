import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:wonderful_indonesia/provider/auth_provider.dart';
import 'package:wonderful_indonesia/provider/onboarding_provider.dart';
import 'package:wonderful_indonesia/routes.dart';
import 'package:wonderful_indonesia/theme.dart';
import 'package:wonderful_indonesia/ui/screens/dashboard/dashboard_screen.dart';
import 'package:wonderful_indonesia/ui/screens/login_screen.dart';
import 'package:wonderful_indonesia/ui/screens/onboarding_screen.dart';

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
        ChangeNotifierProvider<OnboardingProvider>(
          create: (_) => OnboardingProvider(),
        ),
      ],
      child: FutureBuilder<FirebaseApp>(
          future: _initialization,
          builder: (BuildContext ctx, AsyncSnapshot<FirebaseApp> snapshot) {
            if (snapshot.hasData) {
              return GetMaterialApp(
                title: 'Wonderful Indonesia',
                debugShowCheckedModeBanner: false,
                theme: theme,
                getPages: pages,
                home: Consumer2<AuthProvider, OnboardingProvider>(builder: (
                  BuildContext context,
                  AuthProvider authProvider,
                  OnboardingProvider onboardingProvider,
                  _,
                ) {
                  return onboardingProvider.isOnboarded
                      ? authProvider.isAuthenticated
                          ? const DashboardScreen()
                          : const LoginScreen()
                      : const OnboardingScreen();
                }),
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
