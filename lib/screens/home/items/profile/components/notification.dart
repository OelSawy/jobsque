import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/colours.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      "Notifications",
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
          Container(
              height: 5.h,
              width: 100.w,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 0.1.h, color: AppColours.neutral200),
                  color: AppColours.neutral100),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Text("Job notifications",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral500)))),
          //! job notifications options
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Your Job Search Alert",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            Switch(
                              value: context
                                  .watch<ProfileProvider>()
                                  .state
                                  .jobSearchAlert,
                              onChanged: context
                                  .read<ProfileProvider>()
                                  .jobSearchAlertChange,
                            )
                          ])),
                  Container(
                    height: 0.2.h,
                    color: AppColours.neutral200,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Job Application Update",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            Switch(
                              value: context
                                  .watch<ProfileProvider>()
                                  .state
                                  .jobApplicationUpdate,
                              onChanged: context
                                  .read<ProfileProvider>()
                                  .jobApplicationUpdateChange,
                            )
                          ])),
                  Container(
                    height: 0.2.h,
                    color: AppColours.neutral200,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Job Application Reminders",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            Switch(
                              value: context
                                  .watch<ProfileProvider>()
                                  .state
                                  .jobApplicationReminders,
                              onChanged: context
                                  .read<ProfileProvider>()
                                  .jobApplicationRemindersChange,
                            )
                          ])),
                  Container(
                    height: 0.2.h,
                    color: AppColours.neutral200,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Jobs You May Be Interested In",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            Switch(
                              value: context
                                  .watch<ProfileProvider>()
                                  .state
                                  .interestedInJobs,
                              onChanged: context
                                  .read<ProfileProvider>()
                                  .interestedInJobsChange,
                            )
                          ])),
                  Container(
                    height: 0.2.h,
                    color: AppColours.neutral200,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 6.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Job Seeker Updates",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            Switch(
                              value: context
                                  .watch<ProfileProvider>()
                                  .state
                                  .jobSeekerUpdates,
                              onChanged: context
                                  .read<ProfileProvider>()
                                  .jobSeekerUpdatesChange,
                            )
                          ])),
                ],
              )),
          Divider(height: 2.h, color: Colors.transparent),
          Container(
              height: 5.h,
              width: 100.w,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 0.1.h, color: AppColours.neutral200),
                  color: AppColours.neutral100),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Text("Other notifications",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral500)))),
          //! other notifications options
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    height: 6.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Show Profile",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral900)),
                          const Spacer(),
                          Switch(
                            value: context
                                .watch<ProfileProvider>()
                                .state
                                .showProfile,
                            onChanged: context
                                .read<ProfileProvider>()
                                .showProfileChange,
                          )
                        ])),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    height: 6.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("All Message",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral900)),
                          const Spacer(),
                          Switch(
                            value: context
                                .watch<ProfileProvider>()
                                .state
                                .allMessages,
                            onChanged: context
                                .read<ProfileProvider>()
                                .allMessagesChange,
                          )
                        ])),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    height: 6.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Message Nudges",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral900)),
                          const Spacer(),
                          Switch(
                            value: context
                                .watch<ProfileProvider>()
                                .state
                                .messageNudges,
                            onChanged: context
                                .read<ProfileProvider>()
                                .messageNudgesChange,
                          )
                        ])),
              ],
            ),
          )
        ],
      )),
    );
  }
}
