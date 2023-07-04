import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/app_routes.dart';
import '../../../../../../../core/colours.dart';
import '../../../provider/profile_provider.dart';

class TwoFactorAuthenticationPhoneVerification extends StatelessWidget {
  const TwoFactorAuthenticationPhoneVerification({super.key});

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
        Divider(
          height: 2.h,
          color: Colors.transparent,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SizedBox(
            height: 84.4.h,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add phone number",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColours.neutral900),
                      ),
                      const Spacer(),
                      Text(
                        "We will send a verification code to this number",
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColours.neutral500),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 2.h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              height: 9.h,
              width: 90.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1.sp, color: AppColours.neutral300)),
              child: InternationalPhoneNumberInput(
                countrySelectorScrollControlled: false,
                onSaved: context
                    .read<ProfileProvider>()
                    .onPhoneVerificationChange,
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                onInputChanged: context
                    .read<ProfileProvider>()
                    .onPhoneVerificationChange,
                inputBorder: InputBorder.none,
              ),
            ),
            Divider(height: 0.5.h, color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    context
                                .read<ProfileProvider>()
                                .state
                                .phoneVerificationErrorMessgae ==
                            null
                        ? ""
                        : context
                            .read<ProfileProvider>()
                            .state
                            .phoneVerificationErrorMessgae
                            .toString(),
                    style: TextStyle(
                        color: AppColours.danger500,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400))
              ],
            ),
            Divider(height: 2.h, color: Colors.transparent),
            Text(
              "Enter your password",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColours.neutral900),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 2.h,
              ),
              padding: EdgeInsets.all(2.sp),
              height: 9.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1.sp,
                      color: context
                                  .watch<ProfileProvider>()
                                  .state
                                  .phoneVerificationPass ==
                              null
                          ? AppColours.neutral300
                          : context
                                      .watch<ProfileProvider>()
                                      .state
                                      .phoneVerificationPassErrorMessage !=
                                  null
                              ? AppColours.danger500
                              : AppColours.primary500)),
              child: TextField(
                controller: context
                    .read<ProfileProvider>()
                    .state
                    .phoneVerificationPassController,
                onChanged: context
                    .read<ProfileProvider>()
                    .onPhoneVerificationPassChange,
                onSubmitted: context
                    .read<ProfileProvider>()
                    .onPhoneVerificationPassChange,
                style: TextStyle(fontSize: 14.sp),
                autofillHints: const [AutofillHints.password],
                obscureText: context
                    .watch<ProfileProvider>()
                    .state
                    .hidePhoneVerificationPass,
                decoration: InputDecoration(
                    suffix: IconButton(
                      iconSize: 18.sp,
                      onPressed: () => context
                          .read<ProfileProvider>()
                          .showPhoneVerificationPass(),
                      icon: context
                              .watch<ProfileProvider>()
                              .state
                              .hidePhoneVerificationPass
                          ? const Icon(Iconsax.eye_slash4)
                          : const Icon(Iconsax.eye3),
                    ),
                    prefixIcon: const Icon(Iconsax.lock4),
                    prefixIconColor: context
                                .read<ProfileProvider>()
                                .state
                                .phoneVerificationPass ==
                            null
                        ? AppColours.neutral300
                        : context
                                    .read<ProfileProvider>()
                                    .state
                                    .phoneVerificationPassErrorMessage !=
                                null
                            ? AppColours.danger500
                            : AppColours.primary500,
                    border: InputBorder.none,
                    hintText: "12345678",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColours.neutral400)),
              ),
            ),
            Divider(height: 0.5.h, color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    context
                                .read<ProfileProvider>()
                                .state
                                .phoneVerificationPassErrorMessage ==
                            null
                        ? ""
                        : context
                            .read<ProfileProvider>()
                            .state
                            .phoneVerificationPassErrorMessage
                            .toString(),
                    style: TextStyle(
                        color: AppColours.danger500,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400))
              ],
            ),
            const Spacer(),
            //! button
            SizedBox(
              width: 90.w,
              height: 7.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      AppRoutes.twoFactorAuthenticationVerificationCode);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.read<ProfileProvider>().verifyPhoneVerification() ? AppColours.primary500 : AppColours.neutral300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: context.read<ProfileProvider>().verifyPhoneVerification() ? Colors.white : AppColours.neutral500,
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
      ]),
    )));
  }
}
