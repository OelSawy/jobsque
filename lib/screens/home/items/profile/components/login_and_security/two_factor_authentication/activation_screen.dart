import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/app_routes.dart';
import '../../../../../../../core/colours.dart';

class TwoFactorAuthenticationActivation extends StatelessWidget {
  const TwoFactorAuthenticationActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Column(
          children: [
            Divider(
              height: 5.h,
              color: Colors.transparent,
            ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(2.sp),
                        height: 9.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1.sp, color: AppColours.neutral300)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 60.w,
                              child: Text(
                                "Secure your account with two-step verification",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColours.neutral500),
                              ),
                            ),
                            Switch(
                              value: context
                                  .watch<ProfileProvider>()
                                  .state
                                  .isTwoFactorAuthEnabled,
                              onChanged: context
                                  .read<ProfileProvider>()
                                  .twoFactorAuthenticationChange,
                            )
                          ],
                        )),
                    Divider(
                      height: 4.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select a verification method",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColours.neutral900,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 2.h,
                        bottom: 3.h,
                      ),
                      padding: EdgeInsets.all(2.sp),
                      height: 9.h,
                      width: 90.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.sp, color: AppColours.neutral300)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton(
                                        icon: const Icon(Iconsax.arrow_down_14),
                                        value: context
                                            .watch<ProfileProvider>()
                                            .state
                                            .verificationMethod,
                                        onChanged: context
                                            .read<ProfileProvider>()
                                            .verificationMethodChange,
                                        items: [
                                          DropdownMenuItem(
                                            value: VerificationMethod
                                                .authenticator,
                                            child: Text(
                                              "Authenticator app",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColours.neutral500),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: VerificationMethod.sms,
                                            child: Text(
                                              "Telephone number (SMS)",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColours.neutral500),
                                            ),
                                          ),
                                        ]))),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColours.neutral500),
                    ),
                    const Spacer(),
                    //! button
                    SizedBox(
                      width: 90.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                                  .read<ProfileProvider>()
                                  .state
                                  .isTwoFactorAuthEnabled
                              ? Navigator.of(context).pushNamed(AppRoutes
                                  .twoFactorAuthenticationPhoneVerification)
                              : null;
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
            )
          ],
        ),
      ),
    );
  }
}
