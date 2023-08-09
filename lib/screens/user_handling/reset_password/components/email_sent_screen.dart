import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/user_handling/reset_password/provider/reset_password_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/assets.dart';
import '../../../../core/colours.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            //! back button
            Positioned(
                top: 6.5.h,
                left: 3.w,
                child: IconButton(
                    iconSize: 20.sp,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Iconsax.arrow_left4,
                    ))),
            //!  icon and text
            Positioned(
                top: 12.h,
                child: SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(AppAssets.ellipse5, scale: 1.2.sp),
                          Image.asset(AppAssets.ellipse6, scale: 1.2.sp),
                          Icon(Iconsax.directbox_receive4,
                              size: 60.sp, color: AppColours.primary500)
                        ],
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 2.h,
                      ),
                      Text("Check your Email",
                          style: TextStyle(
                              fontSize: 15.5.sp, fontWeight: FontWeight.w500)),
                      Divider(
                        color: Colors.transparent,
                        height: 2.h,
                      ),
                      Text(
                          "We have sent a reset password to your email address",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColours.neutral500,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                )),
            //! open email app button
            Positioned(
              bottom: 4.h,
              left: 5.w,
              child: SizedBox(
                width: 90.w,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () => context.read<ResetPasswordProvider>().openEmailApp(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.primary500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    "Open email app",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 37.h,
                right: 28.w,
                child: Image.asset(
                  AppAssets.ellipse7,
                  scale: 1.2.sp,
                )),
            Positioned(
                top: 30.h,
                left: 23.w,
                child: Image.asset(
                  AppAssets.ellipse8,
                  scale: 1.2.sp,
                )),
            Positioned(
              top: 22.h,
              right: 30.w,
              child: Image.asset(AppAssets.ellipse9, scale: 1.2.sp))
          ],
        ),
      ),
    );
  }
}