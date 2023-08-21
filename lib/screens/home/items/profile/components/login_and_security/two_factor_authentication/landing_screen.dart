import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/colours.dart';

class TwoFactorAuthenticationLanding extends StatelessWidget {
  const TwoFactorAuthenticationLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Column(children: [
          Divider(height: 5.h, color: Colors.transparent,),
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
                  "Two-step verification",
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
          Divider(
        height: 2.h,
        color: Colors.transparent,
          ),
          Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SizedBox(
          height: 83.h,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: AppColours.primary100,
                    child: Icon(
                      Iconsax.lock4,
                      size: 20.sp,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      "Two-step verification provides additional security by asking for a verification code every time you log in on another device.",
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: AppColours.neutral500,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Divider(
                height: 5.h,
                color: Colors.transparent,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: AppColours.primary100,
                    child: Icon(
                      Iconsax.external_drive4,
                      size: 20.sp,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      "Adding a phone number or using an authenticator will help keep your account safe from harm.",
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: AppColours.neutral500,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              const Spacer(),
              //! button
              SizedBox(
                width: 90.w,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.twoFactorAuthenticationActivation);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.primary500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 5.h,
              ),
            ],
          ),
        ),
          ),
        ]),
      ),
    );
  }
}
