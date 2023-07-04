
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/colours.dart';

class TwoFactorAuthenticationVerificationCode extends StatelessWidget {
  const TwoFactorAuthenticationVerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
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
        Divider(height: 2.h, color: Colors.transparent),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SizedBox(
            height: 84.4.h,
            child: Column(children: [
              SizedBox(
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter the 6 digit code",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColours.neutral900),
                        ),
                        Divider(height: 2.h, color: Colors.transparent),
                        SizedBox(
                          width: 80.w,
                          child: Text(
                            "Please confirm your account by entering the authorization code sent to ****-****-${context.read<ProfileProvider>().state.phoneVerification!.phoneNumber!.substring(context.read<ProfileProvider>().state.phoneVerification!.phoneNumber!.length - 4)}",
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.neutral500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(height: 2.h, color: Colors.transparent),
              //! verification code
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 7.h,
                    width: 13.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: TextField(
                      controller:
                          context.read<ProfileProvider>().state.code1Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                      onChanged: (value) {
                        context.read<ProfileProvider>().code1Change(value);
                        value.length == 1
                            ? FocusScope.of(context).nextFocus()
                            : null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 13.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: TextField(
                      controller:
                          context.read<ProfileProvider>().state.code2Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                      onChanged: (value) {
                        context.read<ProfileProvider>().code2Change(value);
                        value.length == 1
                            ? FocusScope.of(context).nextFocus()
                            : value.isEmpty ? FocusScope.of(context).previousFocus() : null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 13.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: TextField(
                      controller:
                          context.read<ProfileProvider>().state.code3Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                      onChanged: (value) {
                        context.read<ProfileProvider>().code3Change(value);
                        value.length == 1
                            ? FocusScope.of(context).nextFocus()
                            : value.isEmpty ? FocusScope.of(context).previousFocus() : null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 13.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: TextField(
                      controller:
                          context.read<ProfileProvider>().state.code4Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                      onChanged: (value) {
                        context.read<ProfileProvider>().code4Change(value);
                        value.length == 1
                            ? FocusScope.of(context).nextFocus()
                            : value.isEmpty ? FocusScope.of(context).previousFocus() : null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 13.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: TextField(
                      controller:
                          context.read<ProfileProvider>().state.code5Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                      onChanged: (value) {
                        context.read<ProfileProvider>().code5Change(value);
                        value.length == 1
                            ? FocusScope.of(context).nextFocus()
                            : value.isEmpty ? FocusScope.of(context).previousFocus() : null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 7.h,
                    width: 13.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: TextField(

                      controller:
                          context.read<ProfileProvider>().state.code6Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                      onChanged: (value) {
                        context.read<ProfileProvider>().code6Change(value);
                        value.length == 1
                            ? FocusScope.of(context).unfocus()
                            : value.isEmpty ? FocusScope.of(context).previousFocus() : null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        )
      ]),
    )));
  }
}
