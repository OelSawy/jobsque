import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/home/items/profile/widgets/profile_widgets.dart';
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
          height: 27.h,
          child: Stack(
            children: [
              Container(
                height: 20.h,
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
                                    iconSize: 20.sp,
                                    icon: const Icon(Iconsax.arrow_left4)),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Profile",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () =>
                                      context.read<HomeProvider>().logout(context),
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
                          height: 14.h,
                          width: 14.h,
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
                                  radius: 6.5.h,
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
              Text(context.read<HomeProvider>().state.profile.name,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),
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
                                  fontSize: 13.sp,
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
                                  fontSize: 13.sp,
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
                                  fontSize: 13.sp,
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
        const ProfileGeneral(),
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
        const ProfileOthers()
      ],
    ));
  }
}
