// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:jobsque/screens/home/provider/home_provider.dart';

// ignore: must_be_immutable
class SuggestedJobItem extends StatelessWidget {
  int? index;

  SuggestedJobItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColours.primary900,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 20.h,
        width: 90.w,
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
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (context
                                .read<HomeProvider>()
                                .state
                                .suggestedJobs[index!])
                            .name,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                      Text(
                        "${(context.read<HomeProvider>().state.suggestedJobs[index!]).compName} • ${(context.read<HomeProvider>().state.suggestedJobs[index!]).location.split(",").last}",
                        style: TextStyle(
                            color: AppColours.neutral400, fontSize: 9.5.sp),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                      context.read<HomeProvider>().savedClicked(context.read<HomeProvider>().state.suggestedJobs[index!]);
                    },
                    icon: context
                            .watch<HomeProvider>()
                            .state
                            .savedJobs
                            .where((element) => element.jobId == (context.read<HomeProvider>().state.suggestedJobs[index!]).id).length == 1
                        ? const Icon(Iconsax.archive_15)
                        : const Icon(Iconsax.archive_add4),
                    color: context
                            .watch<HomeProvider>()
                            .state
                            .savedJobs
                            .where((element) => element.jobId == (context.read<HomeProvider>().state.suggestedJobs[index!]).id).length == 1
                        ? AppColours.primary500
                        : Colors.white,
                    iconSize: 20.sp)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 4.h,
                    width: 22.w,
                    padding: EdgeInsets.all(1.w),
                    decoration: BoxDecoration(
                      color: AppColours.neutral400,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      (context
                              .read<HomeProvider>()
                              .state
                              .suggestedJobs[index!])
                          .jobTimeType,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  Container(
                    height: 4.h,
                    width: 22.w,
                    padding: EdgeInsets.all(1.w),
                    decoration: BoxDecoration(
                      color: AppColours.neutral400,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      /* context
                          .read<HomeProvider>()
                          .state
                          .suggestedJobs[widget.index!]
                          .jobType! */
                      "Onsite",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  Container(
                    height: 4.h,
                    width: 22.w,
                    padding: EdgeInsets.all(1.w),
                    decoration: BoxDecoration(
                      color: AppColours.neutral400,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      (context
                              .read<HomeProvider>()
                              .state
                              .suggestedJobs[index!])
                          .jobLevel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text:
                          "\$${((context.read<HomeProvider>().state.suggestedJobs[index!])).salary}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "/Month",
                          style: TextStyle(
                            color: AppColours.neutral100,
                            fontSize: 8.sp,
                          ),
                        )
                      ])),
                  SizedBox(
                    width: 28.w,
                    height: 5.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColours.primary500,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Text(
                        "Apply Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
