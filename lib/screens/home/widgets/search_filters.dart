import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/colours.dart';
import '../provider/home_provider.dart';

Widget filters(BuildContext context) {
  return SizedBox(
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
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.w, right: 5.w),
                                  child: SizedBox(
                                    width: 100.w,
                                    height: 90.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                icon: const Icon(
                                                    Iconsax.arrow_left)),
                                            Text("Set Filter",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.sp)),
                                            InkWell(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    context
                                                        .read<HomeProvider>()
                                                        .resetFilters();
                                                  },
                                                );
                                              },
                                              child: Text(
                                                "Reset",
                                                style: TextStyle(
                                                    fontSize: 9.5.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColours.primary500),
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
                                                    color:
                                                        AppColours.neutral300,
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
                                                  child:
                                                      DropdownButtonFormField(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    isExpanded: true,
                                                    isDense: true,
                                                    value: context
                                                        .watch<HomeProvider>()
                                                        .state
                                                        .jobTitleValue,
                                                    onChanged: context
                                                        .read<HomeProvider>()
                                                        .jobTitleValueChanged,
                                                    icon: const Icon(
                                                        Iconsax.arrow_down_14),
                                                    iconSize: 15.sp,
                                                    decoration:
                                                        const InputDecoration(
                                                            border: InputBorder
                                                                .none),
                                                    items: const [
                                                      DropdownMenuItem(
                                                          value: 0,
                                                          child: Text(
                                                              "example 1")),
                                                      DropdownMenuItem(
                                                          value: 1,
                                                          child: Text(
                                                              "example 2")),
                                                      DropdownMenuItem(
                                                          value: 2,
                                                          child: Text(
                                                              "example 3")),
                                                      DropdownMenuItem(
                                                          value: 3,
                                                          child: Text(
                                                              "example 4")),
                                                      DropdownMenuItem(
                                                          value: 4,
                                                          child: Text(
                                                              "example 5")),
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
                                                    color:
                                                        AppColours.neutral300,
                                                    width: 0.5.sp)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  width: 10.w,
                                                  child: const Icon(
                                                      Iconsax.location),
                                                ),
                                                SizedBox(
                                                  width: 75.w,
                                                  child:
                                                      DropdownButtonFormField(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    isExpanded: true,
                                                    isDense: true,
                                                    value: context
                                                        .watch<HomeProvider>()
                                                        .state
                                                        .locationValue,
                                                    onChanged: context
                                                        .read<HomeProvider>()
                                                        .locationValueChanged,
                                                    icon: const Icon(
                                                        Iconsax.arrow_down_14),
                                                    iconSize: 15.sp,
                                                    decoration:
                                                        const InputDecoration(
                                                            border: InputBorder
                                                                .none),
                                                    items: const [
                                                      DropdownMenuItem(
                                                          value: 0,
                                                          child: Text(
                                                              "example 1")),
                                                      DropdownMenuItem(
                                                          value: 1,
                                                          child: Text(
                                                              "example 2")),
                                                      DropdownMenuItem(
                                                          value: 2,
                                                          child: Text(
                                                              "example 3")),
                                                      DropdownMenuItem(
                                                          value: 3,
                                                          child: Text(
                                                              "example 4")),
                                                      DropdownMenuItem(
                                                          value: 4,
                                                          child: Text(
                                                              "example 5")),
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
                                                    color:
                                                        AppColours.neutral300,
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
                                                  child:
                                                      DropdownButtonFormField(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    isExpanded: true,
                                                    isDense: true,
                                                    value: context
                                                        .watch<HomeProvider>()
                                                        .state
                                                        .salaryValue,
                                                    onChanged: context
                                                        .read<HomeProvider>()
                                                        .salaryValueChanged,
                                                    icon: const Icon(
                                                        Iconsax.arrow_down_14),
                                                    iconSize: 15.sp,
                                                    decoration:
                                                        const InputDecoration(
                                                            border: InputBorder
                                                                .none),
                                                    items: const [
                                                      DropdownMenuItem(
                                                          value: 0,
                                                          child: Text(
                                                              "example 1")),
                                                      DropdownMenuItem(
                                                          value: 1,
                                                          child: Text(
                                                              "example 2")),
                                                      DropdownMenuItem(
                                                          value: 2,
                                                          child: Text(
                                                              "example 3")),
                                                      DropdownMenuItem(
                                                          value: 3,
                                                          child: Text(
                                                              "example 4")),
                                                      DropdownMenuItem(
                                                          value: 4,
                                                          child: Text(
                                                              "example 5")),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Divider(
                                          color: Colors.transparent,
                                          height: 2.h,
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
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColours.primary500,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50))),
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
                                const Text("Job Type"),
                                Divider(
                                  height: 4.h,
                                  color: Colors.transparent,
                                ),
                                Wrap(
                                  spacing: 10.sp,
                                  runSpacing: 10.sp,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobTypeValueChanged(1);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobTypeValue ==
                                                  1
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobTypeValue ==
                                                      1
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobTypes[0],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobTypeValue ==
                                                            1
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobTypeValueChanged(2);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobTypeValue ==
                                                  2
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobTypeValue ==
                                                      2
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobTypes[1],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobTypeValue ==
                                                            2
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobTypeValueChanged(3);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobTypeValue ==
                                                  3
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobTypeValue ==
                                                      3
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobTypes[2],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobTypeValue ==
                                                            3
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<HomeProvider>().filterResults();
                                      Navigator.of(context).pop();
                                    },
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
                      color:
                          context.watch<HomeProvider>().state.jobTypeValue == 0
                              ? null
                              : AppColours.primary100,
                      border: Border.all(
                          color: context
                                      .watch<HomeProvider>()
                                      .state
                                      .jobTypeValue ==
                                  0
                              ? AppColours.neutral300
                              : AppColours.primary300,
                          width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            context.watch<HomeProvider>().state.jobTypeValue ==
                                    0
                                ? "Job Type"
                                : context.read<HomeProvider>().state.jobTypes[
                                    context
                                            .read<HomeProvider>()
                                            .state
                                            .jobTypeValue -
                                        1],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: context
                                            .watch<HomeProvider>()
                                            .state
                                            .jobTypeValue ==
                                        0
                                    ? AppColours.neutral500
                                    : AppColours.primary500)),
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
                                const Text("Job Time"),
                                Divider(
                                  height: 4.h,
                                  color: Colors.transparent,
                                ),
                                Wrap(
                                  spacing: 10.sp,
                                  runSpacing: 10.sp,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobTimeValueChanged(1);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobTimeValue ==
                                                  1
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobTimeValue ==
                                                      1
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                context
                                                    .read<HomeProvider>()
                                                    .state
                                                    .jobTimes[0],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobTimeValue ==
                                                            1
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobTimeValueChanged(2);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobTimeValue ==
                                                  2
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobTimeValue ==
                                                      2
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                context
                                                    .read<HomeProvider>()
                                                    .state
                                                    .jobTimes[1],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobTimeValue ==
                                                            2
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobTimeValueChanged(3);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobTimeValue ==
                                                  3
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobTimeValue ==
                                                      3
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                context
                                                    .read<HomeProvider>()
                                                    .state
                                                    .jobTimes[2],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobTimeValue ==
                                                            3
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<HomeProvider>().filterResults();
                                      Navigator.of(context).pop();
                                    },
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
                      color:
                          context.watch<HomeProvider>().state.jobTimeValue == 0
                              ? null
                              : AppColours.primary100,
                      border: Border.all(
                          color: context
                                      .watch<HomeProvider>()
                                      .state
                                      .jobTimeValue ==
                                  0
                              ? AppColours.neutral300
                              : AppColours.primary300,
                          width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            context.watch<HomeProvider>().state.jobTimeValue ==
                                    0
                                ? "Job Time"
                                : context.read<HomeProvider>().state.jobTimes[
                                    context
                                            .read<HomeProvider>()
                                            .state
                                            .jobTimeValue -
                                        1],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: context
                                            .watch<HomeProvider>()
                                            .state
                                            .jobTimeValue ==
                                        0
                                    ? AppColours.neutral500
                                    : AppColours.primary500)),
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
                                const Text("Job Location"),
                                Divider(
                                  height: 4.h,
                                  color: Colors.transparent,
                                ),
                                Wrap(
                                  spacing: 10.sp,
                                  runSpacing: 10.sp,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobLocationValueChanged(1);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobLocationValue ==
                                                  1
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobLocationValue ==
                                                      1
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobLocations[0],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobLocationValue ==
                                                            1
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .jobLocationValueChanged(2);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .jobLocationValue ==
                                                  2
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .jobLocationValue ==
                                                      2
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobLocations[1],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .jobLocationValue ==
                                                            2
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<HomeProvider>().filterResults();
                                      Navigator.of(context).pop();
                                    },
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
                      color: context.watch<HomeProvider>().state.jobLocationValue == 0 ? null : AppColours.primary100,
                      border: Border.all(
                          color: context.watch<HomeProvider>().state.jobLocationValue == 0 ? AppColours.neutral300 : AppColours.primary300, width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.watch<HomeProvider>().state.jobLocationValue == 0 ? "Job Location" : context.read<HomeProvider>().state.jobLocations[context.read<HomeProvider>().state.jobLocationValue-1],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: context.watch<HomeProvider>().state.jobLocationValue == 0 ? AppColours.neutral500 : AppColours.primary500)),
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
                                Divider(
                                  height: 4.h,
                                  color: Colors.transparent,
                                ),
                                Wrap(
                                  spacing: 10.sp,
                                  runSpacing: 10.sp,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .datePostedValueChanged(1);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .datePostedValue ==
                                                  1
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .datePostedValue ==
                                                      1
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobDates[0],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .datePostedValue ==
                                                            1
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .datePostedValueChanged(2);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .datePostedValue ==
                                                  2
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .datePostedValue ==
                                                      2
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobDates[1],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .datePostedValue ==
                                                            2
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .datePostedValueChanged(3);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .datePostedValue ==
                                                  3
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .datePostedValue ==
                                                      3
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobDates[2],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .datePostedValue ==
                                                            3
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<HomeProvider>()
                                            .datePostedValueChanged(4);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 35.w,
                                        height: 7.h,
                                        decoration: BoxDecoration(
                                          color: context
                                                      .watch<HomeProvider>()
                                                      .state
                                                      .datePostedValue ==
                                                  4
                                              ? AppColours.primary100
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: context
                                                          .watch<HomeProvider>()
                                                          .state
                                                          .datePostedValue ==
                                                      4
                                                  ? AppColours.primary300
                                                  : AppColours.neutral300,
                                              width: 0.5.sp),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(context.read<HomeProvider>().state.jobDates[3],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9.5.sp,
                                                    color: context
                                                                .watch<
                                                                    HomeProvider>()
                                                                .state
                                                                .datePostedValue ==
                                                            4
                                                        ? AppColours.primary500
                                                        : AppColours
                                                            .neutral500)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<HomeProvider>().filterResults();
                                      Navigator.of(context).pop();
                                    },
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
                      color: context.watch<HomeProvider>().state.datePostedValue == 0 ? null : AppColours.primary100,
                      border: Border.all(
                          color: context.watch<HomeProvider>().state.datePostedValue == 0 ? AppColours.neutral300 : AppColours.primary300, width: 0.5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.watch<HomeProvider>().state.datePostedValue == 0 ? "Date Posted" : context.read<HomeProvider>().state.jobDates[context.read<HomeProvider>().state.datePostedValue-1],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.5.sp,
                                color: context.watch<HomeProvider>().state.datePostedValue == 0 ? AppColours.neutral500 : AppColours.primary500)),
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
          );
}