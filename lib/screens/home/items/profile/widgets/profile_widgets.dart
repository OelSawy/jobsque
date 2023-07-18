import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/colours.dart';

class ProfileGeneral extends StatelessWidget {
  const ProfileGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //! edit profile
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.editProfile);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  height: 8.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.sp,
                          child: CircleAvatar(
                            backgroundColor: AppColours.primary100,
                            foregroundColor: AppColours.primary500,
                            radius: 18.sp,
                            child: Icon(
                              Iconsax.frame_1,
                              size: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Edit Profile",
                            style: TextStyle(
                                fontSize: 11.sp,
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
            //! portfolio
            InkWell(
              onTap: () {
                context.read<ProfileProvider>().loadPorfolios();
                Navigator.pushNamed(context, AppRoutes.portfolio);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  height: 8.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.sp,
                          child: CircleAvatar(
                            backgroundColor: AppColours.primary100,
                            foregroundColor: AppColours.primary500,
                            radius: 18.sp,
                            child: Icon(
                              Iconsax.folder_favorite4,
                              size: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Portfolios",
                            style: TextStyle(
                                fontSize: 11.sp,
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
            //! language
            InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  height: 8.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.sp,
                          child: CircleAvatar(
                            backgroundColor: AppColours.primary100,
                            foregroundColor: AppColours.primary500,
                            radius: 18.sp,
                            child: Icon(
                              Iconsax.global4,
                              size: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Language",
                            style: TextStyle(
                                fontSize: 11.sp,
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
            //! notifications
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profileNotification);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  height: 8.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.sp,
                          child: CircleAvatar(
                            backgroundColor: AppColours.primary100,
                            foregroundColor: AppColours.primary500,
                            radius: 18.sp,
                            child: Icon(
                              Iconsax.notification4,
                              size: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Notifications",
                            style: TextStyle(
                                fontSize: 11.sp,
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
            //! login and security
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.loginAndSecurity);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  height: 8.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.sp,
                          child: CircleAvatar(
                            backgroundColor: AppColours.primary100,
                            foregroundColor: AppColours.primary500,
                            radius: 18.sp,
                            child: Icon(
                              Iconsax.lock4,
                              size: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Login and security",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.neutral900)),
                        const Spacer(),
                        const Icon(Iconsax.arrow_right_14)
                      ])),
            ),
          ],
        ));
  }
}

class ProfileOthers extends StatelessWidget {
  const ProfileOthers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  height: 7.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Accesibility",
                            style: TextStyle(
                                fontSize: 11.sp,
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
                  height: 7.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Help Center",
                            style: TextStyle(
                                fontSize: 11.sp,
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
                  height: 7.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Terms & Conditions",
                            style: TextStyle(
                                fontSize: 11.sp,
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
                  height: 7.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Privacy Policy",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.neutral900)),
                        const Spacer(),
                        const Icon(Iconsax.arrow_right_14)
                      ])),
            ),
          ],
        ));
  }
}
