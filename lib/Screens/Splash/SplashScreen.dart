import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tagerhasan/Core/SessionManagment.dart';
import 'package:tagerhasan/Screens/Intro/IntroScreen.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';




class SplashScreen extends StatefulWidget {
  static const routeName="/Splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToIntro();
  }


  void _navigateToIntro() {
    Timer(const Duration(seconds: 3), () {
      SessionManagement.isOnboarding()?Navigator.pushReplacementNamed(context,LoginScreen.routeName):Navigator.pushReplacementNamed(
          context,
          IntroScreen.routeName
      );
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          scale: 2,),
      ),
    );
  }


}

