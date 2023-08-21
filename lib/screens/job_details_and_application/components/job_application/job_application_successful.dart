import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/assets.dart';
import '../../../../core/colours.dart';

class JobApplicationSuccessful extends StatelessWidget {
  const JobApplicationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SizedBox(
                height: 15.h,
                width: 100.w,
                child: Column(
                  children: [
                    Divider(height: 5.h, color: Colors.transparent,),
                    Stack(children: [
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
                        child: Text("Apply for Job",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500)),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
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
                          Icon(Iconsax.clipboard_tick4,
                              size: 60.sp, color: AppColours.primary500)
                        ],
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text("Your data has been successfully sent",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.5.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                            "You will get a message from our team, about the announcement of employee acceptance",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: AppColours.neutral500,
                                fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                )),
            //! return home button
            Positioned(
              bottom: 4.h,
              left: 5.w,
              child: SizedBox(
                width: 90.w,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.home, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.primary500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    "Return to home",
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
