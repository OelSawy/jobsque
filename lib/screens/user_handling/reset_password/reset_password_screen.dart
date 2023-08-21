import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/user_handling/reset_password/provider/reset_password_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/assets.dart';
import '../../../core/colours.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                    Text("Reset Password",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    Divider(
                      color: Colors.transparent,
                      height: 1.5.h,
                    ),
                    Text("Enter the email address you used when you joined and we'll send you instructions to reset your password.",
                        style: TextStyle(
                            fontSize: 9.5.sp, fontWeight: FontWeight.w400)),
                    //! email text field
                    Container(
                      padding: EdgeInsets.all(1.w),
                      margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                      alignment: Alignment.center,
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.sp,
                              color: context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .email ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<ResetPasswordProvider>()
                                              .state
                                              .emailErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: context
                            .read<ResetPasswordProvider>()
                            .state
                            .emailController,
                        onChanged:
                            context.read<ResetPasswordProvider>().onEmailChange,
                        onSubmitted:
                            context.read<ResetPasswordProvider>().onEmailChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your email....",
                          hintStyle: TextStyle(
                              fontSize: 12.sp, color: AppColours.neutral400),
                          prefixIcon: const Icon(
                            Iconsax.sms4,
                          ),
                          prefixIconColor: context
                                      .watch<ResetPasswordProvider>()
                                      .state
                                      .email ==
                                  null
                              ? AppColours.neutral300
                              : context
                                          .watch<ResetPasswordProvider>()
                                          .state
                                          .emailErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.primary500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    //! text to login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Remember your password? ",
                            style: TextStyle(
                                fontSize: 9.5.sp, fontWeight: FontWeight.w400)),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColours.primary500)),
                        ),
                      ],
                    ),
                    //! password reset button
                    SizedBox(
                      width: 90.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ResetPasswordProvider>().validate() ==
                                  true
                              ? context
                                  .read<ResetPasswordProvider>()
                                  .sendEmail(context)
                              : null;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: context
                                        .read<ResetPasswordProvider>()
                                        .validate() ==
                                    true
                                ? AppColours.primary500
                                : AppColours.neutral300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Request password reset",
                          style: TextStyle(
                              color: context
                                          .read<ResetPasswordProvider>()
                                          .validate() ==
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
