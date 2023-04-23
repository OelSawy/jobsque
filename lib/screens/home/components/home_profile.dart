import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 29.h,
          child: Stack(
            children: [
              Container(
                height: 22.h,
                color: AppColours.primary100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        //! header
                        SizedBox(
                          height: 10.h,
                          width: 100.w,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                    onPressed: () => context
                                        .read<HomeProvider>()
                                        .returnHome(),
                                    icon: const Icon(Iconsax.arrow_left4)),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Profile",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () =>
                                      context.read<HomeProvider>().logout(),
                                  icon: Icon(
                                    Iconsax.logout_14,
                                    color: AppColours.danger500,
                                  ),
                                  iconSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        //! profile image
                        SizedBox(
                          height: 16.h,
                          width: 16.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 7.h,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  radius: 6.h,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              Divider(
                color: Colors.transparent,
                height: 1.h,
              ),
              Text("Name Here",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
              Divider(
                color: Colors.transparent,
                height: 1.h,
              ),
              Text("Title here",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400)),
              Divider(
                color: Colors.transparent,
                height: 3.h,
              ),
              //! Stats
              Container(
                height: 11.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 29.9.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Applied",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                          Text("00",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      height: 5.h,
                      width: 0.1.w,
                      color: AppColours.neutral300,
                    ),
                    SizedBox(
                      width: 29.9.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Reviewed",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                          Text("00",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      height: 5.h,
                      width: 0.1.w,
                      color: AppColours.neutral300,
                    ),
                    SizedBox(
                      width: 29.9.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Contacted",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                          Text("00",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              //! About
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("About",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral500)),
                  InkWell(
                    onTap: () {},
                    child: Text("Edit",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColours.primary500)),
                  ),
                ],
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed semper nunc. Sed euismod, nunc sit amet ultricies lacinia, nunc nisl ultricies nisl, nec ultricies nisl nunc euismod nisl. Sed euismod, nunc sit amet ultricies lacinia, nunc nisl ultricies nisl, nec ultricies nisl nunc euismod nisl.",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColours.neutral500)),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
            ],
          ),
        ),
        //! General
        Container(
            height: 5.h,
            width: 100.w,
            decoration: BoxDecoration(
                border: Border.all(width: 0.1.h, color: AppColours.neutral200),
                color: AppColours.neutral100),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Text("General",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColours.neutral500)))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40.sp,
                              child: CircleAvatar(
                                backgroundColor: AppColours.primary100,
                                foregroundColor: AppColours.primary500,
                                radius: 20.sp,
                                child: Icon(
                                  Iconsax.frame_1,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Edit Profile",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40.sp,
                              child: CircleAvatar(
                                backgroundColor: AppColours.primary100,
                                foregroundColor: AppColours.primary500,
                                radius: 20.sp,
                                child: Icon(
                                  Iconsax.folder_favorite4,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Portfolio",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40.sp,
                              child: CircleAvatar(
                                backgroundColor: AppColours.primary100,
                                foregroundColor: AppColours.primary500,
                                radius: 20.sp,
                                child: Icon(
                                  Iconsax.global4,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Language",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40.sp,
                              child: CircleAvatar(
                                backgroundColor: AppColours.primary100,
                                foregroundColor: AppColours.primary500,
                                radius: 20.sp,
                                child: Icon(
                                  Iconsax.notification4,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Notifications",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40.sp,
                              child: CircleAvatar(
                                backgroundColor: AppColours.primary100,
                                foregroundColor: AppColours.primary500,
                                radius: 20.sp,
                                child: Icon(
                                  Iconsax.lock4,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Login and security",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
              ],
            )),
        Container(
            height: 5.h,
            width: 100.w,
            decoration: BoxDecoration(
                border: Border.all(width: 0.1.h, color: AppColours.neutral200),
                color: AppColours.neutral100),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Text("Others",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColours.neutral500)))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Accesibility",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Help Center",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Terms & Conditions",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
                Container(
                  height: 0.2.h,
                  color: AppColours.neutral200,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 10.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Privacy Policy",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColours.neutral900)),
                            const Spacer(),
                            const Icon(Iconsax.arrow_right_14)
                          ])),
                ),
              ],
            )),
      ],
    ));
  }
}
