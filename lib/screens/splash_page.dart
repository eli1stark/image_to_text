import 'package:flutter/material.dart';
import 'package:image_to_text/screens/home.dart';
import 'package:image_to_text/styles/styles.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text(
        'Text to Image',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      gradientBackground: customGradient,
      photoSize: 50.0,
      image: Image.asset('assets/notepad.png'),
      loaderColor: Colors.white,
    );
  }
}
