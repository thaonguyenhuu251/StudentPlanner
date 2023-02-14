import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studentplanner/constants/color.dart';
import 'package:studentplanner/screens/screen_onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.lightBlue,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset("assets/images/logo.png"),
            ),
            flex: 10,
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Student Planner App",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MainColor.darkPrimary),
            ),
          )
        ],
      ),
    );
  }
}
