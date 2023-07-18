import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class JobDescription extends StatelessWidget {
  Datum job;
  JobDescription({super.key, required this.job});

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
              job.jobDescription,
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
              job.jobSkill,
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
