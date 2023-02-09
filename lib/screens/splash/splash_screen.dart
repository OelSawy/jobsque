import 'package:flutter/material.dart';
import 'package:jobsque/screens/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
              "assets/images/splash_screen/Ellipse 817.png", scale: 1.2.sp
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/splash_screen/Ellipse 816.png", scale: 1.2.sp
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/splash_screen/Ellipse 815.png", scale: 1.2.sp
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/splash_screen/Ellipse 814.png", scale: 1.2.sp
            ),
          ),
          Center(
              child: Image.asset(
            "assets/images/components/big logo.png",
            scale: 1.2.sp,
          )),
        ],
      ),
    );
  }
}
