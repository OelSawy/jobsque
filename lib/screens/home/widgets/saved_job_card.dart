import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/colours.dart';

// ignore: must_be_immutable
class SavedJobCard extends StatelessWidget {
  Datum? job;

  SavedJobCard({super.key, required this.job});

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
                  child: Container(color: Colors.blue,),
                ),
                SizedBox(width: 5.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job!.name,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      "${job!.compName} • ${job!.location.split(",").last}",
                      style: TextStyle(fontSize: 9.5.sp, color: AppColours.neutral700, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                              height: 30.h,
                              width: 100.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //! apply
                                    InkWell(
                                        onTap: () {
                                          /* context
                                              .read<JobDetailsProvider>()
                                              .apply(
                                                  context,
                                                  context
                                                      .read<HomeProvider>()
                                                      .state
                                                      .recentJobs
                                                      .indexOf(job!)); */
                                        },
                                        child: Container(
                                            height: 7.h,
                                            width: 90.w,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 3.w),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColours.neutral300),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Iconsax.directbox_notif4),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  "Apply for Job",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                    Iconsax.arrow_right_34)
                                              ],
                                            ))),
                                    //! share
                                    InkWell(
                                        onTap: () {},
                                        child: Container(
                                            height: 7.h,
                                            width: 90.w,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 3.w),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColours.neutral300),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Row(
                                              children: [
                                                const Icon(Iconsax.export_1),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  "Share via...",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                    Iconsax.arrow_right_34)
                                              ],
                                            ))),
                                    //! remove from saved
                                    InkWell(
                                        onTap: () {
                                          context
                                              .read<HomeProvider>()
                                              .savedClicked(job);
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                            height: 7.h,
                                            width: 90.w,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 3.w),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColours.neutral300),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Iconsax.archive_minus4),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  "Cancel Save",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                    Iconsax.arrow_right_34)
                                              ],
                                            )))
                                  ],
                                ),
                              ));
                        },
                      );
                    },
                    icon: const Icon(Iconsax.more4),
                    color: Colors.black,
                    iconSize: 20.sp)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Posted 2 days ago",
                  style: TextStyle(
                      fontSize: 8.sp,
                      color: AppColours.neutral700,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Icon(Iconsax.clock4),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Be an early applicant",
                          style: TextStyle(
                              fontSize: 8.sp,
                              color: AppColours.neutral700,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
