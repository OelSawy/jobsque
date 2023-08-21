import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/data/models/job_application_models/get_applied_jobs_response_model.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AppliedJobItem extends StatelessWidget {
  DatumA job;
  AppliedJobItem({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColours.primary100,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 14.h,
        width: 90.w,
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 15.w,
                    color: Colors.blue,
                  )),
              SizedBox(
                width: 40.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context
                          .read<HomeProvider>()
                          .state
                          .recentJobs
                          .where((element) => element.id == job.jobsId)
                          .toList()
                          .first
                          .compName,
                      style: TextStyle(color: AppColours.neutral900, fontSize: 11.sp),
                    ),
                    Text(
                      job.accept == true
                          ? "You have been accepted for the selection interview"
                          : "Waiting to be selected by the ${context.read<HomeProvider>().state.recentJobs.where((element) => element.id == job.jobsId).toList().first.compName} team",
                      style: TextStyle(
                          color: AppColours.neutral700, fontSize: 7.sp),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 4.h,
                width: 17.w,
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  color: job.accept == true
                      ? AppColours.success200
                      : AppColours.primary200,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  job.accept == true ? "Accepted" : "Submitted",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: job.accept == true
                        ? AppColours.success700
                        : AppColours.primary700,
                    fontSize: 7.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
