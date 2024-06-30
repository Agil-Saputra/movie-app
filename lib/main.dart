import 'package:flutter/material.dart';
import 'package:movie_app/pages/onboarding.dart';
import 'package:movie_app/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'MovieList',
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const Onboarding(),
      },
    );
  }
}
