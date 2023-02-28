import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_routes.dart';
import '../../../core/assets.dart';
import '../../../core/colours.dart';
import '../../../data/models/home_models/job_model.dart';
import '../provider/home_provider.dart';
import 'job_card.dart';

class HomeSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //! clear search button
    return [
      IconButton(
        icon: const Icon(
          Iconsax.close_circle4,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //! return button
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Iconsax.arrow_left));
  }

  @override
  Widget buildResults(BuildContext context) {
    int jobTitleValue = 0;
    int locationValue = 0;
    int salaryValue = 0;
    List<JobModel> results = [];
    //! filling results list
    query.compareTo("") == 0
        ? null
        : context.read<HomeProvider>().state.history.contains(query)
            ? null
            : context.read<HomeProvider>().state.history.add(query);
    results = context
        .read<HomeProvider>()
        .state
        .recentJobs
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            color: Colors.transparent,
            height: 2.h,
          ),
          //! filters
          SizedBox(
            width: 100.w,
            height: 5.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //! general filters
                IconButton(
                    onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: SizedBox(
                                width: 100.w,
                                height: 90.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: Colors.transparent,
                                      height: 4.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon:
                                                const Icon(Iconsax.arrow_left)),
                                        Text("Set Filter",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp)),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Reset",
                                            style: TextStyle(
                                                fontSize: 9.5.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColours.primary500),
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 4.h,
                                    ),
                                    const Text(
                                      "Job Title",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 1.h,
                                    ),
                                    Container(
                                        height: 7.h,
                                        width: 90.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColours.neutral300,
                                                width: 0.5.sp)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                                width: 10.w,
                                                child: const Icon(
                                                    Iconsax.briefcase)),
                                            SizedBox(
                                              width: 75.w,
                                              child: DropdownButtonFormField(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                isExpanded: true,
                                                isDense: true,
                                                value: jobTitleValue,
                                                onChanged: (newValue) {
                                                  jobTitleValue =
                                                      newValue as int;
                                                },
                                                icon: const Icon(
                                                    Iconsax.arrow_down_14),
                                                iconSize: 15.sp,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none),
                                                items: const [
                                                  DropdownMenuItem(
                                                      value: 0,
                                                      child: Text("example 1")),
                                                  DropdownMenuItem(
                                                      value: 1,
                                                      child: Text("example 2")),
                                                  DropdownMenuItem(
                                                      value: 2,
                                                      child: Text("example 3")),
                                                  DropdownMenuItem(
                                                      value: 3,
                                                      child: Text("example 4")),
                                                  DropdownMenuItem(
                                                      value: 4,
                                                      child: Text("example 5")),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 2.h,
                                    ),
                                    const Text(
                                      "Location",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 1.h,
                                    ),
                                    Container(
                                        height: 7.h,
                                        width: 100.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColours.neutral300,
                                                width: 0.5.sp)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 10.w,
                                              child:
                                                  const Icon(Iconsax.location),
                                            ),
                                            SizedBox(
                                              width: 75.w,
                                              child: DropdownButtonFormField(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                isExpanded: true,
                                                isDense: true,
                                                value: locationValue,
                                                onChanged: (newValue) {
                                                  locationValue =
                                                      newValue as int;
                                                },
                                                icon: const Icon(
                                                    Iconsax.arrow_down_14),
                                                iconSize: 15.sp,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none),
                                                items: const [
                                                  DropdownMenuItem(
                                                      value: 0,
                                                      child: Text("example 1")),
                                                  DropdownMenuItem(
                                                      value: 1,
                                                      child: Text("example 2")),
                                                  DropdownMenuItem(
                                                      value: 2,
                                                      child: Text("example 3")),
                                                  DropdownMenuItem(
                                                      value: 3,
                                                      child: Text("example 4")),
                                                  DropdownMenuItem(
                                                      value: 4,
                                                      child: Text("example 5")),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 2.h,
                                    ),
                                    const Text(
                                      "Salary",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 1.h,
                                    ),
                                    Container(
                                        height: 7.h,
                                        width: 90.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColours.neutral300,
                                                width: 0.5.sp)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 10.w,
                                              child: const Icon(
                                                  Iconsax.dollar_circle),
                                            ),
                                            SizedBox(
                                              width: 75.w,
                                              child: DropdownButtonFormField(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                isExpanded: true,
                                                isDense: true,
                                                value: salaryValue,
                                                onChanged: (newValue) {
                                                  salaryValue = newValue as int;
                                                },
                                                icon: const Icon(
                                                    Iconsax.arrow_down_14),
                                                iconSize: 15.sp,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none),
                                                items: const [
                                                  DropdownMenuItem(
                                                      value: 0,
                                                      child: Text("example 1")),
                                                  DropdownMenuItem(
                                                      value: 1,
                                                      child: Text("example 2")),
                                                  DropdownMenuItem(
                                                      value: 2,
                                                      child: Text("example 3")),
                                                  DropdownMenuItem(
                                                      value: 3,
                                                      child: Text("example 4")),
                                                  DropdownMenuItem(
                                                      value: 4,
                                                      child: Text("example 5")),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Job Type",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11.sp),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 2.h,
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 90.w,
                                      height: 7.h,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColours.primary500,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50))),
                                        child: Text(
                                          "Show result",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    icon: const Icon(Iconsax.setting_44)),
                SizedBox(width: 1.w),
                //! job type filter
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: SizedBox(
                            height: 40.h,
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Divider(
                                  color: Colors.transparent,
                                  height: 4.h,
                                ),
                                const Text("Filtering Title"),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColours.primary500,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    child: Text(
                                      "Show result",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
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
                //! job time filter
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: SizedBox(
                            height: 40.h,
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Divider(
                                  color: Colors.transparent,
                                  height: 4.h,
                                ),
                                const Text("Filtering Title"),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColours.primary500,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    child: Text(
                                      "Show result",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
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
                //! job location filter
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: SizedBox(
                            height: 40.h,
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Divider(
                                  color: Colors.transparent,
                                  height: 4.h,
                                ),
                                const Text("Filtering Title"),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColours.primary500,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    child: Text(
                                      "Show result",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
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
                //! job date posted filter
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w, left: 5.w),
                          child: SizedBox(
                            height: 40.h,
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Divider(
                                  color: Colors.transparent,
                                  height: 4.h,
                                ),
                                const Text("Filtering Title"),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColours.primary500,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    child: Text(
                                      "Show result",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
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
          //! text
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
          //! no results
          SizedBox(
            width: 100.w,
            height: 70.h,
            child: results.isEmpty
                ? Stack(
                    children: [
                      //!  icon and text
                      Positioned(
                          top: 12.h,
                          child: SizedBox(
                            width: 100.w,
                            // height: 50.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(AppAssets.ellipse5,
                                        scale: 1.2.sp),
                                    Image.asset(AppAssets.ellipse6,
                                        scale: 1.2.sp),
                                    Icon(Iconsax.search_zoom_out,
                                        size: 60.sp,
                                        color: AppColours.primary500),
                                  ],
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: 2.h,
                                ),
                                Text("Search not found",
                                    style: TextStyle(
                                        fontSize: 15.5.sp,
                                        fontWeight: FontWeight.w500)),
                                Divider(
                                  color: Colors.transparent,
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, right: 10.w),
                                  child: Text(
                                      "Try searching with different keywords so we can show you",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 9.5.sp,
                                          color: AppColours.neutral500,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          )),
                    ],
                  )
                //! results
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.jobDetails,
                              arguments: index);
                        },
                        child: JobCard(
                          job: results[index],
                        ),
                      );
                    },
                    itemCount: results.length,
                  ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            //! header
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
            //! history list
            SizedBox(
              height: 35.h,
              child: context.watch<HomeProvider>().state.history.isEmpty
                  ? const Center(child: Text("No past Searches"))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: InkWell(
                            onTap: () {
                              query = context
                                  .read<HomeProvider>()
                                  .state
                                  .history[index];
                              showResults(context);
                            },
                            child: Row(
                              children: [
                                const Icon(Iconsax.clock),
                                SizedBox(width: 3.w),
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
                                    onPressed: () => context
                                        .read<HomeProvider>()
                                        .clearHistoryItem(index),
                                    icon: Icon(
                                      Iconsax.close_circle4,
                                      color: AppColours.danger500,
                                    ))
                              ],
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
                          context.watch<HomeProvider>().state.history.length,
                    ),
            ),
            //! header
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
            //! suggestions list
            SizedBox(
              height: 35.h,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: InkWell(
                      onTap: () {
                        query = context
                            .read<HomeProvider>()
                            .state
                            .suggestions[index];
                        showResults(context);
                      },
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
