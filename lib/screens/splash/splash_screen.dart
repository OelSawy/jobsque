import 'package:flutter/material.dart';
import 'package:jobsque/core/assets.dart';
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
              AppAssets.ellipse1, scale: 1.2.sp
            ),
          ),
          Center(
            child: Image.asset(
              AppAssets.ellipse2, scale: 1.2.sp
            ),
          ),
          Center(
            child: Image.asset(
              AppAssets.ellipse3, scale: 1.2.sp
            ),
          ),
          Center(
            child: Image.asset(
              AppAssets.ellipse4, scale: 1.2.sp
            ),
          ),
          Center(
              child: Image.asset(
            AppAssets.bigLogo,
            scale: 1.2.sp,
          )),
        ],
      ),
    );
  }
}
