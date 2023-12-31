import 'dart:async';

import 'package:distressed_property/screens/login_screen.dart';
import 'package:distressed_property/screens/mainscreen.dart';
import 'package:distressed_property/theme/color_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (context.mounted && FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainAppScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorTheme.primaryColor,
      body: Center(
          child: Image.asset(
        "assets/images/logo.png",
        height: 250,
        width: 250,
      )),
    );
  }
}
