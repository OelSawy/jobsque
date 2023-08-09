import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/colours.dart';
import '../../provider/profile_provider.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

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
                          "Email address",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Main E-mail Address",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(2.sp),
                        margin: EdgeInsets.only(top: 1.h),
                        alignment: Alignment.center,
                        height: 9.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1.sp,
                                color: context
                                            .watch<ProfileProvider>()
                                            .state
                                            .email ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<ProfileProvider>()
                                                .state
                                                .emailErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500)),
                        child: TextField(
                          controller: context
                              .read<ProfileProvider>()
                              .state
                              .emailController,
                          onChanged:
                              context.read<ProfileProvider>().onEmailChange,
                          onSubmitted:
                              context.read<ProfileProvider>().onEmailChange,
                          style: TextStyle(fontSize: 14.sp),
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.sms4),
                              prefixIconColor:
                                  context.read<ProfileProvider>().state.email ==
                                          null
                                      ? AppColours.neutral300
                                      : context
                                                  .read<ProfileProvider>()
                                                  .state
                                                  .emailErrorMessage !=
                                              null
                                          ? AppColours.danger500
                                          : AppColours.primary500,
                              border: InputBorder.none,
                              hintText: "Email"),
                        ),
                      ),
                      Divider(height: 0.5.h,color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              context
                                          .read<ProfileProvider>()
                                          .state
                                          .emailErrorMessage ==
                                      null
                                  ? ""
                                  : context
                                      .read<ProfileProvider>()
                                      .state
                                      .emailErrorMessage
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
                          onPressed: () {
                            context.read<ProfileProvider>().checkEmail() == true
                                ? context
                                    .read<ProfileProvider>()
                                    .saveEmail(context)
                                : null;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: context
                                          .read<ProfileProvider>()
                                          .checkEmail() ==
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
                                            .checkEmail() ==
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
