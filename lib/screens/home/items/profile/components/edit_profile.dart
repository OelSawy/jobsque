import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:jobsque/screens/home/widgets/misc_widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<ProfileProvider>().state.detailsLoadingState ==
              LoadingState.loading
          ? SizedBox(
              height: 100.h,
              child: const Loading(),
            )
          : SafeArea(
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
                          "Edit Profile",
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
              Divider(height: 1.h, color: Colors.transparent),
              CircleAvatar(
                radius: 6.h,
                backgroundColor: AppColours.primary500,
              ),
              Divider(height: 2.h, color: Colors.transparent),
              InkWell(
                onTap: () {},
                child: Text(
                  "Change Photo",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColours.primary500),
                ),
              ),
              Divider(height: 2.h, color: Colors.transparent),
              //! forms
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SizedBox(
                  height: 66.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
                        alignment: Alignment.center,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1.sp,
                                color: context
                                            .watch<ProfileProvider>()
                                            .state
                                            .name ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<ProfileProvider>()
                                                .state
                                                .nameErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500)),
                        child: TextField(
                          controller: context
                              .read<ProfileProvider>()
                              .state
                              .nameController,
                          onChanged:
                              context.read<ProfileProvider>().onNameChange,
                          onSubmitted:
                              context.read<ProfileProvider>().onNameChange,
                          style: TextStyle(fontSize: 14.sp),
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Name"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Bio",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
                        alignment: Alignment.center,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1.sp,
                                color: context
                                            .watch<ProfileProvider>()
                                            .state
                                            .bio ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<ProfileProvider>()
                                                .state
                                                .bioErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500)),
                        child: TextField(
                          controller: context
                              .read<ProfileProvider>()
                              .state
                              .bioController,
                          onChanged:
                              context.read<ProfileProvider>().onBioChange,
                          onSubmitted:
                              context.read<ProfileProvider>().onBioChange,
                          style: TextStyle(fontSize: 14.sp),
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Bio"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
                        alignment: Alignment.center,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1.sp,
                                color: context
                                            .watch<ProfileProvider>()
                                            .state
                                            .address ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<ProfileProvider>()
                                                .state
                                                .addressErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500)),
                        child: TextField(
                          controller: context
                              .read<ProfileProvider>()
                              .state
                              .addressController,
                          onChanged:
                              context.read<ProfileProvider>().onAddressChange,
                          onSubmitted:
                              context.read<ProfileProvider>().onAddressChange,
                          style: TextStyle(fontSize: 14.sp),
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Address"),
                        ),
                      ),
                      const Spacer(),
                      //! save button
                      SizedBox(
                        width: 90.w,
                        height: 7.h,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ProfileProvider>().validate() == true
                                ? context
                                    .read<ProfileProvider>()
                                    .saveProfile(context)
                                : null;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  context.read<ProfileProvider>().validate() ==
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
                                            .validate() ==
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
            ]))),
    );
  }
}
