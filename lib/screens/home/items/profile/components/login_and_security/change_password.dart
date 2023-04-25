import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/colours.dart';
import '../../provider/profile_provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: 96.4.h,
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
                          "Change Password",
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
              Divider(height: 3.h, color: Colors.transparent),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      //! old password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter your old password",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.h),
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
                                            .oldPass ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<ProfileProvider>()
                                                .state
                                                .oldPassErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500)),
                        child: TextField(
                          controller: context
                              .read<ProfileProvider>()
                              .state
                              .oldPassController,
                          onChanged:
                              context.read<ProfileProvider>().onOldPassChange,
                          onSubmitted:
                              context.read<ProfileProvider>().onOldPassChange,
                          style: TextStyle(fontSize: 14.sp),
                          autofillHints: const [AutofillHints.password],
                          obscureText: context
                              .watch<ProfileProvider>()
                              .state
                              .hideOldPass,
                          decoration: InputDecoration(
                              suffix: IconButton(
                                iconSize: 18.sp,
                                onPressed: () => context
                                    .read<ProfileProvider>()
                                    .showOldPass(),
                                icon: context
                                        .watch<ProfileProvider>()
                                        .state
                                        .hideOldPass
                                    ? const Icon(Iconsax.eye_slash4)
                                    : const Icon(Iconsax.eye3),
                              ),
                              prefixIcon: const Icon(Iconsax.lock4),
                              prefixIconColor: context
                                          .read<ProfileProvider>()
                                          .state
                                          .oldPass ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .read<ProfileProvider>()
                                              .state
                                              .oldPassErrorMessage !=
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
                                          .oldPassErrorMessage ==
                                      null
                                  ? ""
                                  : context
                                      .read<ProfileProvider>()
                                      .state
                                      .oldPassErrorMessage
                                      .toString(),
                              style: TextStyle(
                                  color: AppColours.danger500,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      Divider(
                        height: 3.h,
                        color: Colors.transparent,
                      ),
                      //! new password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter your new password",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 1.h,
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
                                            .newPass ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<ProfileProvider>()
                                                .state
                                                .newPassErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500)),
                        child: TextField(
                          controller: context
                              .read<ProfileProvider>()
                              .state
                              .newPassController,
                          onChanged:
                              context.read<ProfileProvider>().onNewPassChange,
                          onSubmitted:
                              context.read<ProfileProvider>().onNewPassChange,
                          style: TextStyle(fontSize: 14.sp),
                          autofillHints: const [AutofillHints.password],
                          obscureText: context
                              .watch<ProfileProvider>()
                              .state
                              .hideNewPass,
                          decoration: InputDecoration(
                              suffix: IconButton(
                                iconSize: 18.sp,
                                onPressed: () => context
                                    .read<ProfileProvider>()
                                    .showNewPass(),
                                icon: context
                                        .watch<ProfileProvider>()
                                        .state
                                        .hideNewPass
                                    ? const Icon(Iconsax.eye_slash4)
                                    : const Icon(Iconsax.eye3),
                              ),
                              prefixIcon: const Icon(Iconsax.lock4),
                              prefixIconColor: context
                                          .read<ProfileProvider>()
                                          .state
                                          .newPass ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .read<ProfileProvider>()
                                              .state
                                              .newPassErrorMessage !=
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
                                          .newPassErrorMessage ==
                                      null
                                  ? ""
                                  : context
                                      .read<ProfileProvider>()
                                      .state
                                      .newPassErrorMessage
                                      .toString(),
                              style: TextStyle(
                                  color: AppColours.danger500,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      Divider(
                        height: 3.h,
                        color: Colors.transparent,
                      ),
                      //! confirm new password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Confirm your new password",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.h),
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
                                            .confirmNewPass ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<ProfileProvider>()
                                                .state
                                                .confirmNewPassErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500)),
                        child: TextField(
                          controller: context
                              .read<ProfileProvider>()
                              .state
                              .confirmNewPassController,
                          onChanged: context
                              .read<ProfileProvider>()
                              .onConfirmNewPassChange,
                          onSubmitted: context
                              .read<ProfileProvider>()
                              .onConfirmNewPassChange,
                          style: TextStyle(fontSize: 14.sp),
                          autofillHints: const [AutofillHints.password],
                          obscureText: context
                              .watch<ProfileProvider>()
                              .state
                              .hideConfirmNewPass,
                          decoration: InputDecoration(
                              suffix: IconButton(
                                iconSize: 18.sp,
                                onPressed: () => context
                                    .read<ProfileProvider>()
                                    .showConfirmNewPassword(),
                                icon: context
                                        .watch<ProfileProvider>()
                                        .state
                                        .hideConfirmNewPass
                                    ? const Icon(Iconsax.eye_slash4)
                                    : const Icon(Iconsax.eye3),
                              ),
                              prefixIcon: const Icon(Iconsax.lock4),
                              prefixIconColor: context
                                          .read<ProfileProvider>()
                                          .state
                                          .confirmNewPass ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .read<ProfileProvider>()
                                              .state
                                              .confirmNewPassErrorMessage !=
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
                                          .confirmNewPassErrorMessage ==
                                      null
                                  ? ""
                                  : context
                                      .read<ProfileProvider>()
                                      .state
                                      .confirmNewPassErrorMessage
                                      .toString(),
                              style: TextStyle(
                                  color: AppColours.danger500,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      const Spacer(),
                      //! save button
                      SizedBox(
                        width: 90.w,
                        height: 7.h,
                        child: ElevatedButton(
                          onPressed: () => context
                              .read<ProfileProvider>()
                              .changePassword(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: context
                                          .read<ProfileProvider>()
                                          .checkPasswords() ==
                                      true
                                  ? AppColours.primary500
                                  : AppColours.neutral300,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: context
                                            .read<ProfileProvider>()
                                            .checkPasswords() ==
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
      )),
    );
  }
}
