import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:5),
        (() => Navigator.pushNamed(context, '/onboarding')));
    Timer(Duration(seconds: 1),
        () => setState(() => opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          child: Image.asset(
            "assets/logo.png",
            width: 220,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
