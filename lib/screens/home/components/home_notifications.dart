import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../core/assets.dart';
import '../../../core/colours.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              //! back button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SizedBox(
                  height: 10.h,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          iconSize: 20.sp,
                          icon: const Icon(Iconsax.arrow_left4)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Notifications",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                    ),
                  ]),
                ),
              ),
              //!  icon and text
              Center(
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
                        Icon(Iconsax.notification_bing4,
                            size: 60.sp, color: AppColours.primary500)
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                    Text("No new notifications yet",
                        style: TextStyle(
                            fontSize: 15.5.sp, fontWeight: FontWeight.w500)),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                          "You will receive a notification if there is something on your account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColours.neutral500,
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              )),
              Positioned(
                  top: 48.h,
                  right: 28.w,
                  child: Image.asset(
                    AppAssets.ellipse7,
                    scale: 1.2.sp,
                  )),
              Positioned(
                  top: 41.h,
                  left: 23.w,
                  child: Image.asset(
                    AppAssets.ellipse8,
                    scale: 1.2.sp,
                  )),
              Positioned(
                  top: 33.h,
                  right: 30.w,
                  child: Image.asset(AppAssets.ellipse9, scale: 1.2.sp))
            ],
          ),
        ),
      ),
    );
  }
}
