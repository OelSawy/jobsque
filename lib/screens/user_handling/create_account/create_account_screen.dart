import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/assets.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/user_handling/create_account/provider/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_routes.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
                    Text("Create Account",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    Divider(
                      color: Colors.transparent,
                      height: 1.5.h,
                    ),
                    Text("Please create an account to find your dream job",
                        style: TextStyle(
                            fontSize: 9.5.sp, fontWeight: FontWeight.w400)),
                    //! username text field
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
                                          .watch<CreateAccountProvider>()
                                          .state
                                          .username ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
                                              .state
                                              .usernameErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        controller: context
                            .read<CreateAccountProvider>()
                            .state
                            .usernameController,
                        onChanged: context
                            .read<CreateAccountProvider>()
                            .onUsernameChange,
                        onSubmitted: context
                            .read<CreateAccountProvider>()
                            .onUsernameChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                          prefixIcon: const Icon(
                            Iconsax.user,
                          ),
                          prefixIconColor: context
                                      .watch<CreateAccountProvider>()
                                      .state
                                      .username ==
                                  null
                              ? AppColours.neutral300
                              : context
                                          .watch<CreateAccountProvider>()
                                          .state
                                          .usernameErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.primary500,
                        ),
                      ),
                    ),
                    //! email text field
                    Container(
                      padding: EdgeInsets.all(1.w),
                      margin: EdgeInsets.only(bottom: 2.h),
                      alignment: Alignment.center,
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.sp,
                              color: context
                                          .watch<CreateAccountProvider>()
                                          .state
                                          .email ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
                                              .state
                                              .emailErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        controller: context
                            .read<CreateAccountProvider>()
                            .state
                            .emailController,
                        onChanged:
                            context.read<CreateAccountProvider>().onEmailChange,
                        onSubmitted:
                            context.read<CreateAccountProvider>().onEmailChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: const Icon(
                            Iconsax.sms4,
                          ),
                          prefixIconColor: context
                                      .watch<CreateAccountProvider>()
                                      .state
                                      .email ==
                                  null
                              ? AppColours.neutral300
                              : context
                                          .watch<CreateAccountProvider>()
                                          .state
                                          .emailErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.primary500,
                        ),
                      ),
                    ),
                    //! password text field
                    Container(
                      padding: EdgeInsets.all(1.w),
                      margin: EdgeInsets.only(bottom: 2.h),
                      alignment: Alignment.center,
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.sp,
                              color: context
                                          .watch<CreateAccountProvider>()
                                          .state
                                          .password ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
                                              .state
                                              .passwordErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        obscureText: context
                            .watch<CreateAccountProvider>()
                            .state
                            .hidePass,
                        controller: context
                            .read<CreateAccountProvider>()
                            .state
                            .passwordController,
                        onChanged: context
                            .read<CreateAccountProvider>()
                            .onPasswordChange,
                        onSubmitted: context
                            .read<CreateAccountProvider>()
                            .onPasswordChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Iconsax.lock,
                            ),
                            prefixIconColor: context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .password ==
                                    null
                                ? AppColours.neutral300
                                : context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .passwordErrorMessage !=
                                        null
                                    ? AppColours.danger500
                                    : AppColours.primary500,
                            suffixIcon: IconButton(
                              onPressed: () => context
                                  .read<CreateAccountProvider>()
                                  .showPassword(),
                              icon: context
                                          .watch<CreateAccountProvider>()
                                          .state
                                          .hidePass ==
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
                                      .watch<CreateAccountProvider>()
                                      .state
                                      .password ==
                                  null
                              ? AppColours.neutral400
                              : context
                                          .watch<CreateAccountProvider>()
                                          .state
                                          .passwordErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.success500,
                        )),
                    Divider(
                      color: Colors.transparent,
                      height: 1.h,
                    ),
                    //! password error message
                    context
                                .watch<CreateAccountProvider>()
                                .state
                                .registerErrorMessage !=
                            null
                        ? Text(
                            context
                                .watch<CreateAccountProvider>()
                                .state
                                .registerErrorMessage!,
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.danger500))
                        : const SizedBox(),
                    const Spacer(),
                    //! already a user
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.neutral400)),
                        SizedBox(
                          width: 1.w,
                        ),
                        InkWell(
                          onTap: () => context
                              .read<CreateAccountProvider>()
                              .navigateToLogin(context),
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.primary500)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                    //! create account button
                    SizedBox(
                      width: 90.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CreateAccountProvider>().validate() ==
                                  true
                              ? context.read<CreateAccountProvider>().register(context)
                              : null;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: context
                                        .read<CreateAccountProvider>()
                                        .validate() ==
                                    true
                                ? AppColours.primary500
                                : AppColours.neutral300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Create account",
                          style: TextStyle(
                              color: context
                                          .read<CreateAccountProvider>()
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
                      height: 2.h,
                    ),
                    //! or sign up with account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 20.w,
                          height: 0.3.h,
                          color: AppColours.neutral300,
                        ),
                        Text("or sign up with account",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.neutral500)),
                        Container(
                          width: 20.w,
                          height: 0.3.h,
                          color: AppColours.neutral300,
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                    //! google and facebook button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => context
                              .read<CreateAccountProvider>()
                              .signInWithGoogle(context),
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.googleButton),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => context
                              .read<CreateAccountProvider>()
                              .signInWithFacebook(context),
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.facebookButton),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 4.h,
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
