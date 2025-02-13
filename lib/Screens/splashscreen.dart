import 'dart:async'; // Import Timer
import 'package:choc_cafe/Screens/loginscreen.dart';
import 'package:choc_cafe/main.dart'; // Ensure this exists
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loginscreen())); // Replace with your target screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashscreen/welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
