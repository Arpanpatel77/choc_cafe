

import 'package:choc_cafe/Screens/home_screen.dart';
import 'package:choc_cafe/Screens/loginscreen.dart';
import 'package:choc_cafe/Screens/mainScreen/main_screen.dart';
import 'package:choc_cafe/Screens/payment.dart';
import 'package:choc_cafe/Widgets/HomeScrenCardTwo.dart';
import 'package:choc_cafe/Widgets/addressbox.dart';
import 'package:choc_cafe/Widgets/background.dart';
import 'package:choc_cafe/Widgets/homescreencard.dart';
import 'package:flutter/material.dart';

import 'Screens/splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

