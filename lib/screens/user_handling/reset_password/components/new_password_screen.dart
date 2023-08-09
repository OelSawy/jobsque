import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/assets.dart';
import '../../../../core/colours.dart';
import '../provider/reset_password_provider.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 13.h,
              child: Stack(
                children: [
                  //! back button
                  Positioned(
                    top: 6.5.h,
                    left: 3.w,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 5.h,
                      width: 25.w,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Iconsax.arrow_left),
                      ),
                    ),
                  ),
                  //! app logo
                  Positioned(
                    top: 6.5.h,
                    right: 5.w,
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      width: 25.w,
                      child: Image.asset(AppAssets.smallLogo, scale: 1.7),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100.w,
              height: 87.h,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! create account text
                    Text("Create new password",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    Divider(
                      color: Colors.transparent,
                      height: 1.5.h,
                    ),
                    Text(
                        "Set your new password so you can login and acces Jobsque",
                        style: TextStyle(
                            fontSize: 9.5.sp, fontWeight: FontWeight.w400)),
                    //! password text field
                    Container(
                      padding: EdgeInsets.all(1.w),
                      margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                      alignment: Alignment.center,
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.sp,
                              color: context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .newPass ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<ResetPasswordProvider>()
                                              .state
                                              .newPassErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        obscureText: context
                            .watch<ResetPasswordProvider>()
                            .state
                            .hideNewPass,
                        controller: context
                            .read<ResetPasswordProvider>()
                            .state
                            .newPassController,
                        onChanged: context
                            .read<ResetPasswordProvider>()
                            .onNewPasswordChange,
                        onSubmitted: context
                            .read<ResetPasswordProvider>()
                            .onNewPasswordChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter new password....",
                            hintStyle: TextStyle(
                                fontSize: 12.sp, color: AppColours.neutral400),
                            prefixIcon: const Icon(
                              Iconsax.lock,
                            ),
                            prefixIconColor: context
                                        .watch<ResetPasswordProvider>()
                                        .state
                                        .newPass ==
                                    null
                                ? AppColours.neutral300
                                : context
                                            .watch<ResetPasswordProvider>()
                                            .state
                                            .newPassErrorMessage !=
                                        null
                                    ? AppColours.danger500
                                    : AppColours.primary500,
                            suffixIcon: IconButton(
                              onPressed: () => context
                                  .read<ResetPasswordProvider>()
                                  .showNewPassword(),
                              icon: context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .hideNewPass ==
                                      true
                                  ? const Icon(Iconsax.eye_slash4)
                                  : const Icon(Iconsax.eye3),
                            )),
                      ),
                    ),
                    //! password error message
                    Text("Password must be at least 8 characters",
                        style: TextStyle(
                          fontSize: 9.5.sp,
                          fontWeight: FontWeight.w400,
                          color: context
                                      .watch<ResetPasswordProvider>()
                                      .state
                                      .newPass ==
                                  null
                              ? AppColours.neutral400
                              : context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .newPassErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.success500,
                        )),
                    //! confirm password text field
                    Container(
                      padding: EdgeInsets.all(1.w),
                      margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                      alignment: Alignment.center,
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.sp,
                              color: context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .confirmNewPass ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<ResetPasswordProvider>()
                                              .state
                                              .confirmNewPassErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        obscureText: context
                            .watch<ResetPasswordProvider>()
                            .state
                            .hideConfirmNewPass,
                        controller: context
                            .read<ResetPasswordProvider>()
                            .state
                            .confirmNewPassController,
                        onChanged: context
                            .read<ResetPasswordProvider>()
                            .onConfirmNewPasswordChange,
                        onSubmitted: context
                            .read<ResetPasswordProvider>()
                            .onConfirmNewPasswordChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm new password....",
                            hintStyle: TextStyle(
                                fontSize: 12.sp, color: AppColours.neutral400),
                            prefixIcon: const Icon(
                              Iconsax.lock,
                            ),
                            prefixIconColor: context
                                        .watch<ResetPasswordProvider>()
                                        .state
                                        .confirmNewPass ==
                                    null
                                ? AppColours.neutral300
                                : context
                                            .watch<ResetPasswordProvider>()
                                            .state
                                            .confirmNewPassErrorMessage !=
                                        null
                                    ? AppColours.danger500
                                    : AppColours.primary500,
                            suffixIcon: IconButton(
                              onPressed: () => context
                                  .read<ResetPasswordProvider>()
                                  .showConfirmNewPassword(),
                              icon: context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .hideConfirmNewPass ==
                                      true
                                  ? const Icon(Iconsax.eye_slash4)
                                  : const Icon(Iconsax.eye3),
                            )),
                      ),
                    ),
                    //! confirm password error message
                    Text("Passwords must match",
                        style: TextStyle(
                          fontSize: 9.5.sp,
                          fontWeight: FontWeight.w400,
                          color: context
                                      .watch<ResetPasswordProvider>()
                                      .state
                                      .confirmNewPass ==
                                  null
                              ? AppColours.neutral400
                              : context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .confirmNewPassErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.success500,
                        )),
                    const Spacer(),
                    //! password reset button
                    SizedBox(
                      width: 90.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                                      .read<ResetPasswordProvider>()
                                      .validateNewPass() ==
                                  true
                              ? context
                                  .read<ResetPasswordProvider>()
                                  .successScreen(context)
                              : null;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: context
                                        .read<ResetPasswordProvider>()
                                        .validateNewPass() ==
                                    true
                                ? AppColours.primary500
                                : AppColours.neutral300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              color: context
                                          .read<ResetPasswordProvider>()
                                          .validateNewPass() ==
                                      true
                                  ? Colors.white
                                  : AppColours.neutral500,
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
