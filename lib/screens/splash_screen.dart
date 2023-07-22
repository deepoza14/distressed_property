import 'dart:async';

import 'package:distressed_property/screens/login_screen.dart';
import 'package:distressed_property/theme/color_theme.dart';
import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorTheme.primaryColor,
      body: Center(child: Image.asset("assets/images/logo.png",height: 250,width: 250,)),
    );
  }
}
