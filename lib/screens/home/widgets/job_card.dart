import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../core/colours.dart';
import '../../../data/models/home_models/job_model.dart';

// ignore: must_be_immutable
class JobCard extends StatefulWidget {
  JobModel? job;
  bool saved = false;

  JobCard({super.key, required this.job});

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
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
                  child:
                      Image.asset(widget.job!.company!.image!, scale: 1.5.sp),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.job!.name!,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      "${widget.job!.company!.name!} • ${widget.job!.company!.location!}",
                      style: TextStyle(fontSize: 9.5.sp),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.saved = !widget.saved;
                      });
                    },
                    icon: widget.saved
                        ? const Icon(Iconsax.archive_15)
                        : const Icon(Iconsax.archive_add4),
                    color: widget.saved ? AppColours.primary500 : Colors.black,
                    iconSize: 20.sp)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 4.h,
                  width: 17.w,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: AppColours.primary100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    widget.job!.jobTime!,
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
                  width: 17.w,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: AppColours.primary100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    widget.job!.jobType!,
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
                  width: 17.w,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: AppColours.primary100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    widget.job!.jobCategory!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColours.primary500,
                      fontSize: 8.sp,
                    ),
                  ),
                ),
                Text.rich(TextSpan(
                    text: "\$${widget.job!.salary!}",
                    style: TextStyle(
                      color: AppColours.success700,
                      fontSize: 12.sp,
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
