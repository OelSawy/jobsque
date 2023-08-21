import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/home/widgets/search_filters.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_routes.dart';
import '../../../core/assets.dart';
import '../../../core/colours.dart';
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
    //! filling results list
    query.compareTo("") == 0
        ? null
        : context.read<HomeProvider>().state.history.contains(query)
            ? null
            : context.read<HomeProvider>().state.history.add(query);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().search(query);
    });
    List<dynamic> results = context.read<HomeProvider>().state.results;
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            color: Colors.transparent,
            height: 2.h,
          ),
          //! filters
          filters(context),
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
              child: Text("Featuring ${results.length}+ jobs",
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
                              arguments: results[index]);
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
