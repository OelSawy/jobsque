import 'package:flutter/material.dart';
import 'package:jobsque/screens/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashProvider>().init(context);
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
            "assets/images/splash_screen/big logo.png",
            scale: 0.9,
          )),
        ],
      ),
    );
  }
}
