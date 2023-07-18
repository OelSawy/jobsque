/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/colours.dart';
import '../../job_details_and_application/provider/job_details_provider.dart';
import '../provider/home_provider.dart';

class AppliedJob extends StatelessWidget {
  const AppliedJob({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<JobDetailsProvider>().accept();
    return SizedBox(
      height: 15.h,
      width: 90.w,
      child: Column(
        children: [
          Container(
              width: 90.w,
              height: 13.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
              decoration: BoxDecoration(
                  color: AppColours.primary100,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! company logo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                        context
                            .read<HomeProvider>()
                            .state
                            .recentJobs[context
                                .read<JobDetailsProvider>()
                                .state
                                .appliedJobIndex!]
                            .company!
                            .image!,
                        scale: 1.5.sp),
                  ),
                  //! text
                  SizedBox(
                    width: 40.w,
                    height: 7.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                              .read<HomeProvider>()
                              .state
                              .recentJobs[context
                                  .read<JobDetailsProvider>()
                                  .state
                                  .appliedJobIndex!]
                              .company!
                              .name!,
                          style: TextStyle(fontSize: 9.5.sp),
                        ),
                        Text(
                          "Waiting to be accepted by the ${context.read<HomeProvider>().state.recentJobs[context.read<JobDetailsProvider>().state.appliedJobIndex!].company!.name!} team",
                          style: TextStyle(fontSize: 7.sp),
                        ),
                      ],
                    ),
                  ),
                  //! status
                  Container(
                      width: 23.w,
                      height: 5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: context.watch<JobDetailsProvider>().state.accepted ? AppColours.success300 :AppColours.primary200,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        context.watch<JobDetailsProvider>().state.accepted ? "Accepted" : "Submitted",
                        style: TextStyle(
                            color: context.watch<JobDetailsProvider>().state.accepted ? AppColours.success800 :AppColours.primary700,
                            fontWeight: FontWeight.w400,
                            fontSize: 9.sp),
                      ))
                ],
              )),
          Divider(
            color: Colors.transparent,
            height: 2.h,
          )
        ],
      ),
    );
  }
} */