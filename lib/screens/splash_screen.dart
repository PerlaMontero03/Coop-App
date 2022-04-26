import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:proyecto_final/screens/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/logo.png'), 
        splashIconSize: 500,
        nextScreen: const Login(),
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: Colors.white,
        duration: 2500,
        )
    );
  }
}