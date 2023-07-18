import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class JobDeatils extends StatefulWidget {
  Datum? job;
  JobDeatils({super.key, required this.job});

  @override
  State<JobDeatils> createState() => _JobDeatilsState();
}

class _JobDeatilsState extends State<JobDeatils> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Stack(children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(children: [
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! header
                SizedBox(
                  height: 6.h,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          iconSize: 20.sp,
                          icon: const Icon(Iconsax.arrow_left4)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Job Details",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                      context.read<HomeProvider>().savedClicked(widget.job);
                    },
                    icon: context
                            .watch<HomeProvider>()
                            .state
                            .savedJobs
                            .where((element) => element.jobId == widget.job!.id).length == 1
                        ? const Icon(Iconsax.archive_15)
                        : const Icon(Iconsax.archive_add4)),
                    )
                  ]),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! company image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(color: Colors.blue,)
                ),
                Divider(
                  color: Colors.transparent,
                  height: 1.h,
                ),
                //! job title
                Text(
                  widget.job!.name,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 1.h,
                ),
                //! company name and location
                Text(
                  "${widget.job!.compName} • ${widget.job!.location.split(",").last}",
                  style: TextStyle(
                      fontSize: 9.5.sp,
                      color: AppColours.neutral700,
                      fontWeight: FontWeight.w400),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 1.h,
                ),
                //! job tags
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      height: 5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColours.primary100),
                      child: Text(
                        widget.job!.jobTimeType,
                        style: TextStyle(
                            color: AppColours.primary500,
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      height: 5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColours.primary100),
                      child: Text(
                        /* context
                            .read<HomeProvider>()
                            .state
                            .recentJobs[widget.index!]
                            .jobType! */"Onsite",
                        style: TextStyle(
                            color: AppColours.primary500,
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      height: 5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColours.primary100),
                      child: Text(
                        widget.job!.jobLevel,
                        style: TextStyle(
                            color: AppColours.primary500,
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! job details sections
                Container(
                  width: 90.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColours.neutral100),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<HomeProvider>()
                                  .state
                                  .selectedJobDetailsSection =
                              SelectedJobDetailsSection.description;
                        }),
                        child: Container(
                          width: 30.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<HomeProvider>()
                                          .state
                                          .selectedJobDetailsSection ==
                                      SelectedJobDetailsSection.description
                                  ? AppColours.information900
                                  : null),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .selectedJobDetailsSection ==
                                        SelectedJobDetailsSection.description
                                    ? Colors.white
                                    : AppColours.neutral500),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<HomeProvider>()
                                  .state
                                  .selectedJobDetailsSection =
                              SelectedJobDetailsSection.company;
                        }),
                        child: Container(
                          width: 30.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<HomeProvider>()
                                          .state
                                          .selectedJobDetailsSection ==
                                      SelectedJobDetailsSection.company
                                  ? AppColours.information900
                                  : null),
                          child: Text(
                            "Company",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .selectedJobDetailsSection ==
                                        SelectedJobDetailsSection.company
                                    ? Colors.white
                                    : AppColours.neutral500),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<HomeProvider>()
                                  .state
                                  .selectedJobDetailsSection =
                              SelectedJobDetailsSection.people;
                        }),
                        child: Container(
                          width: 30.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<HomeProvider>()
                                          .state
                                          .selectedJobDetailsSection ==
                                      SelectedJobDetailsSection.people
                                  ? AppColours.information900
                                  : null),
                          child: Text(
                            "People",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .selectedJobDetailsSection ==
                                        SelectedJobDetailsSection.people
                                    ? Colors.white
                                    : AppColours.neutral500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! selected section body
                Expanded(
                    child: FadingEdgeScrollView.fromSingleChildScrollView(
                        gradientFractionOnEnd: 0.6,
                        child: SingleChildScrollView(
                            controller: scrollController,
                            child: context
                                .watch<HomeProvider>()
                                .chosenJobDetailsSection(widget.job!))))
              ]),
            ),
            //! apply now button
            Positioned(
              bottom: 5.h,
              child: SizedBox(
                width: 90.w,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () => context
                      .read<JobDetailsProvider>()
                      .apply(context, widget.job!),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.primary500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    "Apply now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ])),
    ));
  }
}
