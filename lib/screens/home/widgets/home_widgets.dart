// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:jobsque/screens/home/provider/home_provider.dart';

class HomeSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

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
                  child: Image.asset(
                      context
                          .read<HomeProvider>()
                          .state
                          .recentJobs[widget.index!]
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
                          .recentJobs[widget.index!]
                          .name!,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      "${context.read<HomeProvider>().state.recentJobs[widget.index!].company!.name!} • ${context.read<HomeProvider>().state.recentJobs[widget.index!].company!.location!}",
                      style: TextStyle(
                          fontSize: 9.5.sp),
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
                    color: saved? AppColours.primary500 : Colors.black,
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
                      context
                          .read<HomeProvider>()
                          .state
                          .recentJobs[widget.index!]
                          .jobTime!,
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
                      context
                          .read<HomeProvider>()
                          .state
                          .recentJobs[widget.index!]
                          .jobType!,
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
                      context
                          .read<HomeProvider>()
                          .state
                          .recentJobs[widget.index!]
                          .jobCategory!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColours.primary500,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                  Text.rich(TextSpan(
                      text:
                          "\$${context.read<HomeProvider>().state.recentJobs[widget.index!].salary!.toString()}",
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
