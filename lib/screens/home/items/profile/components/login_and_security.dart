import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/colours.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //! header
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      iconSize: 20.sp,
                      icon: const Icon(Iconsax.arrow_left4),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login and security",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(height: 2.h, color: Colors.transparent),
          Container(
              height: 5.h,
              width: 100.w,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 0.1.h, color: AppColours.neutral200),
                  color: AppColours.neutral100),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Text("Account access",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral500)))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Email address",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Phone number",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Change password",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Two-step verification",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Face ID",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
