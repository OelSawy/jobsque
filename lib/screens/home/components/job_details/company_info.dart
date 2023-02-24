import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:sizer/sizer.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
          width: 90.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Job Description",
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
              Divider(
                color: Colors.transparent,
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 38.w,
                    height: 10.h,
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                color: AppColours.neutral400,
                                fontWeight: FontWeight.w400)),
                        Text("example@example.com",
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Container(
                    width: 38.w,
                    height: 10.h,
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.sp, color: AppColours.neutral300)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Website",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                color: AppColours.neutral400,
                                fontWeight: FontWeight.w400)),
                        Text("example.com",
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w500))
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              Text("Job Description",
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
              Divider(
                color: Colors.transparent,
                height: 1.h,
              ),
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
          )),
    );
  }
}
