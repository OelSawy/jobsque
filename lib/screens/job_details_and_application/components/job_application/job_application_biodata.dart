import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_provider.dart';
import 'package:jobsque/screens/job_details_and_application/widgets/dotted_separator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class JobApplicationBiodata extends StatelessWidget {
  const JobApplicationBiodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 96.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! header
                Row(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Iconsax.arrow_left4)),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text("Apply for Job",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500)),
                ]),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! progress bar
                SizedBox(
                  height: 10.h,
                  width: 90.w,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 25.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColours.primary500,
                              child: CircleAvatar(
                                radius: 19.sp,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColours.primary500,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Text("Biodata",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    color: AppColours.primary500,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.transparent,
                            height: 3.5.h,
                          ),
                          DottedSeparator(dotColor: AppColours.neutral400),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        // width: 25.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColours.neutral400,
                              child: CircleAvatar(
                                radius: 19.sp,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColours.neutral400,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Text("Type of work",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.transparent,
                            height: 3.5.h,
                          ),
                          DottedSeparator(dotColor: AppColours.neutral400),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        // width: 25.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColours.neutral400,
                              child: CircleAvatar(
                                radius: 19.sp,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColours.neutral400,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Text("Upload portfolio",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 3.h,
                ),
                //! biodata info
                Text("Biodata",
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w500)),
                Divider(
                  color: Colors.transparent,
                  height: 1.h,
                ),
                Text(
                  "Fill in your bio data correctly",
                  style: TextStyle(
                      fontSize: 9.5.sp,
                      color: AppColours.neutral600,
                      fontWeight: FontWeight.w400),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! name text field
                Text.rich(TextSpan(
                  text: "Full Name",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "*",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColours.danger500,
                            fontWeight: FontWeight.w400))
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(1.w),
                  margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                  alignment: Alignment.center,
                  height: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.sp,
                          color:
                              context.watch<JobDetailsProvider>().state.name ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<JobDetailsProvider>()
                                              .state
                                              .nameErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                  child: TextField(
                    controller:
                        context.read<JobDetailsProvider>().state.nameController,
                    onChanged: context.read<JobDetailsProvider>().onNameChange,
                    onSubmitted:
                        context.read<JobDetailsProvider>().onNameChange,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
                      prefixIcon: const Icon(
                        Iconsax.user,
                      ),
                      prefixIconColor:
                          context.watch<JobDetailsProvider>().state.name == null
                              ? AppColours.neutral300
                              : context
                                          .watch<JobDetailsProvider>()
                                          .state
                                          .nameErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.primary500,
                    ),
                  ),
                ),
                //! email text field
                Text.rich(TextSpan(
                  text: "Email",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "*",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColours.danger500,
                            fontWeight: FontWeight.w400))
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(1.w),
                  margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                  alignment: Alignment.center,
                  height: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.sp,
                          color:
                              context.watch<JobDetailsProvider>().state.email ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<JobDetailsProvider>()
                                              .state
                                              .emailErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                  child: TextField(
                    controller: context
                        .read<JobDetailsProvider>()
                        .state
                        .emailController,
                    onChanged: context.read<JobDetailsProvider>().onEmailChange,
                    onSubmitted:
                        context.read<JobDetailsProvider>().onEmailChange,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      prefixIcon: const Icon(
                        Iconsax.sms4,
                      ),
                      prefixIconColor:
                          context.watch<JobDetailsProvider>().state.email ==
                                  null
                              ? AppColours.neutral300
                              : context
                                          .watch<JobDetailsProvider>()
                                          .state
                                          .emailErrorMessage !=
                                      null
                                  ? AppColours.danger500
                                  : AppColours.primary500,
                    ),
                  ),
                ),
                //! phone input
                Text.rich(TextSpan(
                  text: "Phone Number",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "*",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColours.danger500,
                            fontWeight: FontWeight.w400))
                  ],
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.w),
                  margin: EdgeInsets.only(top: 2.h),
                  alignment: Alignment.center,
                  height: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.sp, color: AppColours.neutral300)),
                  child: InternationalPhoneNumberInput(
                    onSaved:
                        context.read<JobDetailsProvider>().onPhoneNumberChange,
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: true,
                    onInputChanged:
                        context.read<JobDetailsProvider>().onPhoneNumberChange,
                    inputBorder: InputBorder.none,
                  ),
                ),
                const Spacer(),
                //! next button
                SizedBox(
                  width: 90.w,
                  height: 7.h,
                  child: ElevatedButton(
                    onPressed:
                        context.read<JobDetailsProvider>().validateBiodata() == true
                            ? () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.applicationType);
                              }
                            : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            context.read<JobDetailsProvider>().validateBiodata() ==
                                    true
                                ? AppColours.primary500
                                : AppColours.neutral300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color:
                              context.read<JobDetailsProvider>().validateBiodata() ==
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
        ),
      )),
    );
  }
}
