// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:jobsque/screens/home/provider/home_provider.dart';

import '../../../data/models/home_models/job_model.dart';

class HomeSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Iconsax.close_circle4,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
          context.read<HomeProvider>().state.results.clear();
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Iconsax.arrow_left));
  }

  @override
  Widget buildResults(BuildContext context) {
    query.compareTo("") == 0
        ? null
        : context.read<HomeProvider>().state.history.contains(query)
            ? null
            : context.read<HomeProvider>().state.history.add(query);
    context.read<HomeProvider>().state.results.addAll(context
        .read<HomeProvider>()
        .state
        .recentJobs
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase())));
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            color: Colors.transparent,
            height: 2.h,
          ),
          SizedBox(
            width: 100.w,
            height: 5.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.setting_44)),
                SizedBox(width: 1.w),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 35.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: AppColours.neutral300, width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Job Type",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: AppColours.neutral500)),
                        SizedBox(width: 1.w),
                        Icon(Iconsax.arrow_down_14,
                            color: AppColours.neutral500),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 35.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: AppColours.neutral300, width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Job Time",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: AppColours.neutral500)),
                        SizedBox(width: 1.w),
                        Icon(Iconsax.arrow_down_14,
                            color: AppColours.neutral500),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 35.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: AppColours.neutral300, width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Job Location",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: AppColours.neutral500)),
                        SizedBox(width: 1.w),
                        Icon(Iconsax.arrow_down_14,
                            color: AppColours.neutral500),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 35.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: AppColours.neutral300, width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Date posted",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: AppColours.neutral500)),
                        SizedBox(width: 1.w),
                        Icon(Iconsax.arrow_down_14,
                            color: AppColours.neutral500),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 2.w)
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
              decoration: BoxDecoration(
                  color: AppColours.neutral100,
                  border: Border.all(
                    width: 1.w,
                    color: AppColours.neutral200,
                  )),
              alignment: Alignment.centerLeft,
              child: Text("Featuring 120+ jobs",
                  style: TextStyle(
                      color: AppColours.neutral500,
                      fontWeight: FontWeight.w500,
                      fontSize: 9.5.sp))),
          SizedBox(
            width: 100.w,
            height: 70.h,
            child: context.watch<HomeProvider>().state.results.isEmpty
                ? const Center(child: Text("No results found"))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return JobCard(
                        job: context.read<HomeProvider>().state.results[index],
                      );
                    },
                    itemCount:
                        context.watch<HomeProvider>().state.results.length,
                  ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<HomeProvider>().state.results.clear();
    return SingleChildScrollView(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            Container(
                height: 5.h,
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                decoration: BoxDecoration(
                    color: AppColours.neutral100,
                    border: Border.all(
                      width: 1.sp,
                      color: AppColours.neutral200,
                    )),
                alignment: Alignment.centerLeft,
                child: Text("Recent searches",
                    style: TextStyle(
                        color: AppColours.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 9.5.sp))),
            SizedBox(
              height: 35.h,
              child: context.watch<HomeProvider>().state.history.isEmpty
                  ? const Center(child: Text("No past Searches"))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Row(
                            children: [
                              const Icon(Iconsax.clock),
                              SizedBox(width: 1.w),
                              Text(
                                  context
                                      .read<HomeProvider>()
                                      .state
                                      .history[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9.5.sp)),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<HomeProvider>()
                                        .state
                                        .history
                                        .removeAt(index);
                                  },
                                  icon: Icon(
                                    Iconsax.close_circle4,
                                    color: AppColours.danger500,
                                  ))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 2.h,
                          color: Colors.transparent,
                        );
                      },
                      itemCount:
                          context.watch<HomeProvider>().state.history.length,
                    ),
            ),
            Container(
                height: 5.h,
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                decoration: BoxDecoration(
                    color: AppColours.neutral100,
                    border: Border.all(
                      width: 1.sp,
                      color: AppColours.neutral200,
                    )),
                alignment: Alignment.centerLeft,
                child: Text("Popular searches",
                    style: TextStyle(
                        color: AppColours.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 9.5.sp))),
            SizedBox(
              height: 35.h,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 5.h,
                        child: Row(
                          children: [
                            const Icon(Iconsax.search_status4),
                            SizedBox(width: 3.w),
                            Text(
                                context
                                    .read<HomeProvider>()
                                    .state
                                    .suggestions[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9.5.sp)),
                            const Spacer(),
                            Icon(
                              Iconsax.arrow_circle_right,
                              color: AppColours.primary500,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  );
                },
                itemCount:
                    context.read<HomeProvider>().state.suggestions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

// ignore: must_be_immutable
class SuggestedJobItem extends StatefulWidget {
  int? index;

  SuggestedJobItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<SuggestedJobItem> createState() => _SuggestedJobItemState();
}

class _SuggestedJobItemState extends State<SuggestedJobItem> {
  bool saved = false;

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
        width: 80.w,
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
                    child: Image.asset(
                        context
                            .read<HomeProvider>()
                            .state
                            .suggestedJobs[widget.index!]
                            .company!
                            .image!,
                        scale: 1.5.sp),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context
                            .read<HomeProvider>()
                            .state
                            .suggestedJobs[widget.index!]
                            .name!,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                      Text(
                        "${context.read<HomeProvider>().state.suggestedJobs[widget.index!].company!.name!} • ${context.read<HomeProvider>().state.suggestedJobs[widget.index!].company!.location!}",
                        style: TextStyle(
                            color: AppColours.neutral400, fontSize: 9.5.sp),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          saved = !saved;
                        });
                      },
                      icon: saved
                          ? const Icon(Iconsax.archive_15)
                          : const Icon(Iconsax.archive_add4),
                      color: Colors.white,
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
                      context
                          .read<HomeProvider>()
                          .state
                          .suggestedJobs[widget.index!]
                          .jobTime!,
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
                      context
                          .read<HomeProvider>()
                          .state
                          .suggestedJobs[widget.index!]
                          .jobType!,
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
                      context
                          .read<HomeProvider>()
                          .state
                          .suggestedJobs[widget.index!]
                          .jobCategory!,
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
                          "\$${context.read<HomeProvider>().state.suggestedJobs[widget.index!].salary!.toString()}",
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

// ignore: must_be_immutable
class RecentJobItem extends StatefulWidget {
  int? index;
  RecentJobItem({super.key, required this.index});

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return JobCard(
        job: context.read<HomeProvider>().state.recentJobs[widget.index!]);
  }
}
