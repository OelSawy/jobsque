import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/user_handling/login/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/assets.dart';
import '../../../core/colours.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    Text("Login",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    Divider(
                      color: Colors.transparent,
                      height: 1.5.h,
                    ),
                    Text("Please login to find your dream job",
                        style: TextStyle(
                            fontSize: 9.5.sp, fontWeight: FontWeight.w400)),
                    //! email text field
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
                                          .watch<LoginProvider>()
                                          .state
                                          .email ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<LoginProvider>()
                                              .state
                                              .emailErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: context
                            .read<LoginProvider>()
                            .state
                            .emailController,
                        onChanged:
                            context.read<LoginProvider>().onEmailChange,
                        onSubmitted:
                            context.read<LoginProvider>().onEmailChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: const Icon(
                            Iconsax.sms4,
                          ),
                          prefixIconColor:
                              context.watch<LoginProvider>().state.email ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<LoginProvider>()
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
                                          .watch<LoginProvider>()
                                          .state
                                          .password ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<LoginProvider>()
                                              .state
                                              .passwordErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        obscureText:
                            context.watch<LoginProvider>().state.hidePass,
                        controller: context
                            .read<LoginProvider>()
                            .state
                            .passwordController,
                        onChanged:
                            context.read<LoginProvider>().onPasswordChange,
                        onSubmitted:
                            context.read<LoginProvider>().onPasswordChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Iconsax.lock,
                            ),
                            prefixIconColor:
                                context.watch<LoginProvider>().state.password ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<LoginProvider>()
                                                .state
                                                .passwordErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500,
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  context.read<LoginProvider>().showPassword(),
                              icon: context
                                          .watch<LoginProvider>()
                                          .state
                                          .hidePass ==
                                      true
                                  ? const Icon(Iconsax.eye_slash4)
                                  : const Icon(Iconsax.eye3),
                            )),
                      ),
                    ),
                    //! remember me
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            child: Row(
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateColor.resolveWith((states) {
                                  return context
                                          .watch<LoginProvider>()
                                          .state
                                          .rememberMe
                                      ? AppColours.primary500
                                      : AppColours.neutral300;
                                }),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                value: context
                                    .watch<LoginProvider>()
                                    .state
                                    .rememberMe,
                                onChanged: context
                                    .read<LoginProvider>()
                                    .onChangeRememberMe),
                            Text("Remember me",
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color: AppColours.neutral800,
                                    fontWeight: FontWeight.w400))
                          ],
                        )),
                        InkWell(
                          onTap: () => context
                              .read<LoginProvider>()
                              .navigateToForgotPawwsord(context),
                          child: Text("Forgot password?",
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.primary500)),
                        )
                      ],
                    ),
                    const Spacer(),
                    //! not a user
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.neutral400)),
                        SizedBox(
                          width: 1.w,
                        ),
                        InkWell(
                          onTap: () => context
                              .read<LoginProvider>()
                              .navigateToRegister(context),
                          child: Text("Register",
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
                    //! login button
                    SizedBox(
                      width: 90.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<LoginProvider>().validate() == true
                              ? context.read<LoginProvider>().logIn(context)
                              : null;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                context.read<LoginProvider>().validate() == true
                                    ? AppColours.primary500
                                    : AppColours.neutral300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: context.read<LoginProvider>().validate() ==
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
                    //! or log in with account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 20.w,
                          height: 0.3.h,
                          color: AppColours.neutral300,
                        ),
                        Text("or login with account",
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
                              .read<LoginProvider>()
                              .logInWithGoogle(context),
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
                              .read<LoginProvider>()
                              .logInWithFacebook(context),
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
