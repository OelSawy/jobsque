import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:sizer/sizer.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 90.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Job Description",
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
            Divider(
              color: Colors.transparent,
              height: 1.h,
            ),
            //! job description
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(
                  fontSize: 9.5.sp,
                  color: AppColours.neutral600,
                  fontWeight: FontWeight.w400),
            ),
            Divider(
              color: Colors.transparent,
              height: 2.h,
            ),
            Text("Skills Required",
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
            Divider(
              color: Colors.transparent,
              height: 1.h,
            ),
            //! required skills
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(
                  fontSize: 9.5.sp,
                  color: AppColours.neutral600,
                  fontWeight: FontWeight.w400),
            ),
            Divider(
              color: Colors.transparent,
              height: 15.h,
            ),
          ],
        ));
  }
}
