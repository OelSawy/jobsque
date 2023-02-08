import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/splash_screen/Ellipse 817.png",
            ),
          ),
          Center(
            child: Image.asset("assets/images/splash_screen/Ellipse 816.png"),
          ),
          Center(
            child: Image.asset("assets/images/splash_screen/Ellipse 815.png"),
          ),
          Center(
            child: Image.asset("assets/images/splash_screen/Ellipse 814.png"),
          ),
          Center(
              child: Image.asset(
            "assets/images/splash_screen/J BSQUE.png",
            scale: 0.9,
          )),
          Positioned(
              top: 378,
              left: 138,
              child: Image.asset(
                "assets/images/splash_screen/Vector.png",
                scale: 0.85,
              )),
          Positioned(
            top: 398,
            left: 158,
            child: Image.asset(
              "assets/images/splash_screen/Vector-1.png",
              scale: 0.8,
            ),
          ),
          Positioned(
            top: 381,
            left: 154,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/splash_screen/Vector-2.png",
                  scale: 0.7,
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
            top: 385,
            left: 154,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/splash_screen/Vector-3.png",
                scale: 0.7,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
