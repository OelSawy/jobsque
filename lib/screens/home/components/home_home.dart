import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:jobsque/screens/home/widgets/suggested_job_item.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../widgets/home_search_delegate.dart';
import '../widgets/recent_job_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Column(
            children: [
              Divider(
                color: Colors.transparent,
                height: 5.h,
              ),
              //! header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, {name here}👋",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp)),
                      Divider(
                        color: Colors.transparent,
                        height: 2.h,
                      ),
                      Text("Create a better future for yourself here",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColours.neutral500,
                              fontSize: 9.sp))
                    ],
                  ),
                  //! notification button
                  CircleAvatar(
                    radius: 21.sp,
                    backgroundColor: AppColours.neutral300,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20.sp,
                        child: IconButton(
                            color: Colors.black,
                            onPressed: () {},
                            icon: const Icon(Iconsax.notification4),
                            iconSize: 20.sp)),
                  )
                ],
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              //! search bar
              InkWell(
                onTap: () => showSearch(
                    context: context, delegate: HomeSearchDelegate()),
                child: Container(
                    padding: EdgeInsets.only(left: 5.w),
                    height: 7.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColours.neutral300, width: 0.5.sp),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: [
                        Icon(Iconsax.search_normal4, color: AppColours.neutral400),
                        SizedBox(width: 3.w),
                        Text("Type Something ...", style: TextStyle(fontWeight: FontWeight.w400, color: AppColours.neutral400, fontSize: 9.5.sp),),
                      ],
                    )),
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              //! suggested jobs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suggested Jobs", style: TextStyle(fontSize: 11.sp)),
                  InkWell(
                    child: Text("See All",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColours.primary500,
                            fontWeight: FontWeight.w500)),
                    onTap: () {},
                  )
                ],
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              //! suggested jobs list
              SizedBox(
                height: 25.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SuggestedJobItem(index: index);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 12.sp);
                    },
                    itemCount: context
                        .read<HomeProvider>()
                        .state
                        .suggestedJobs
                        .length),
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              //! recent jobs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Jobs", style: TextStyle(fontSize: 11.sp)),
                  InkWell(
                    child: Text("See All",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColours.primary500,
                            fontWeight: FontWeight.w500)),
                    onTap: () {},
                  )
                ],
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              //! recent jobs list
              SizedBox(
                width: 100.w,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.jobDetails, arguments: index);
                        },
                        child: RecentJobItem(index: index));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 2.h,
                        color: Colors.black,
                      );
                    },
                    itemCount:
                        context.read<HomeProvider>().state.recentJobs.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
