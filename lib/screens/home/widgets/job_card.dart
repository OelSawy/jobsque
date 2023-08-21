import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/colours.dart';

// ignore: must_be_immutable
class JobCard extends StatelessWidget {
  Datum job;

  JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      job.name,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      "${job.compName} • ${job.location.split(",").last}",
                      style: TextStyle(fontSize: 9.5.sp),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      context.read<HomeProvider>().savedClicked(job);
                    },
                    icon: context
                            .watch<HomeProvider>()
                            .state
                            .savedJobs
                            .where((element) => element.jobId == job.id).length == 1
                        ? const Icon(Iconsax.archive_15)
                        : const Icon(Iconsax.archive_add4),
                    color: context
                            .watch<HomeProvider>()
                            .state
                            .savedJobs
                            .where((element) => element.jobId == job.id).length == 1
                        ? AppColours.primary500
                        : Colors.black,
                    iconSize: 20.sp)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 4.h,
                  width: 18.w,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: AppColours.primary100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    job.jobType,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColours.primary500,
                      fontSize: 8.sp,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 4.h,
                  width: 18.w,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: AppColours.primary100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    job.jobTimeType,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColours.primary500,
                      fontSize: 8.sp,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 4.h,
                  width: 18.w,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: AppColours.primary100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    job.jobLevel,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColours.primary500,
                      fontSize: 8.sp,
                    ),
                  ),
                ),
                Text.rich(TextSpan(
                    text: "\$${job.salary}",
                    style: TextStyle(
                      color: AppColours.success700,
                      fontSize: 9.sp,
                    ),
                    children: [
                      TextSpan(
                        text: "/Month",
                        style: TextStyle(
                          color: AppColours.neutral500,
                          fontSize: 8.sp,
                        ),
                      )
                    ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
