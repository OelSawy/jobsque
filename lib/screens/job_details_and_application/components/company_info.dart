import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/job_models/datum.dart';

// ignore: must_be_immutable
class CompanyInfo extends StatelessWidget {
  Datum job;
  CompanyInfo({super.key, required this.job});

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
            //! contact info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 38.w,
                  height: 15.h,
                  padding: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.sp, color: AppColours.neutral300)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Email",
                          style: TextStyle(
                              fontSize: 9.5.sp,
                              color: AppColours.neutral400,
                              fontWeight: FontWeight.w400)),
                      InkWell(
                        onTap: () {
                          try {
                            context
                                .read<JobDetailsProvider>()
                                .openMail(job.compEmail);
                          } on Exception catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        },
                        child: Text(job.compEmail,
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 38.w,
                  height: 15.h,
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
                      InkWell(
                        onTap: () {
                          try {
                            context
                                .read<JobDetailsProvider>()
                                .openUrl(job.compWebsite);
                          } on Exception catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        },
                        child: Text(job.compWebsite,
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.transparent,
              height: 2.h,
            ),
            Text("About Company",
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
            Divider(
              color: Colors.transparent,
              height: 1.h,
            ),
            //! company info
            Text(
              job.aboutComp,
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
