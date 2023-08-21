import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/colours.dart';

class FaceId extends StatelessWidget {
  const FaceId({super.key});

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
              margin: EdgeInsets.symmetric(vertical: 1.h),
              height: 6.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Face ID",
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColours.neutral900)),
                      const Spacer(),
                      Switch(
                        value: context.watch<ProfileProvider>().state.faceID,
                        onChanged: context.read<ProfileProvider>().faceIDChange,
                      )
                    ]),
              ))
        ],
      )),
    );
  }
}
