import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/assets.dart';
import '../../../../core/colours.dart';
import '../provider/reset_password_provider.dart';

class ResetSuccessScreen extends StatelessWidget {
  const ResetSuccessScreen({super.key});

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
                    iconSize: 30.sp,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Iconsax.arrow_left4,
                    ))),
            //!  icon and text
            Positioned(
                top: 22.h,
                child: SizedBox(
                  width: 100.w,
                  // height: 50.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(AppAssets.ellipse5, scale: 1.2.sp),
                          Image.asset(AppAssets.ellipse6, scale: 1.2.sp),
                          Icon(Iconsax.shield_tick4,
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
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Text(
                            "Your password has been changed successfully, we will let you know if there are more problems with your account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                color: AppColours.neutral500,
                                fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                )),
            //! Login button
            Positioned(
              bottom: 4.h,
              left: 5.w,
              child: SizedBox(
                width: 90.w,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () => context
                      .read<ResetPasswordProvider>()
                      .navigateToLoginAfterReset(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.primary500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    "Login",
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