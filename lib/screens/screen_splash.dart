import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentplanner/constants/color.dart';
import 'package:studentplanner/screens/screen_home.dart';
import 'package:studentplanner/screens/screen_onboarding.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<User?> user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Timer(
            Duration(seconds: 5),
                () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => OnboardingScreen())));
      } else {
        Timer(
            Duration(seconds: 5),
                () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen())));
      }
    });

  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
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
