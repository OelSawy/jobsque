import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:jobsque/screens/home/widgets/misc_widgets.dart';
import 'package:jobsque/screens/home/widgets/saved_job_card.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/assets.dart';
import '../../../core/colours.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(children: [
              Divider(
                color: Colors.transparent,
                height: 5.h,
              ),
              //! header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SizedBox(
                  height: 4.h,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            context.read<HomeProvider>().returnHome();
                          },
                          iconSize: 20.sp,
                          icon: const Icon(Iconsax.arrow_left4)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Saved",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                    ),
                  ]),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              //! number of saved jobs
              Container(
                  width: 100.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: AppColours.neutral200,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${context.read<HomeProvider>().state.savedJobs.length} Jobs Saved",
                    style: TextStyle(
                        color: AppColours.neutral500,
                        fontWeight: FontWeight.w500),
                  )),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              context.watch<HomeProvider>().state.savedJobs.isEmpty
                  ? const SizedBox()
                  :
                  //! list of saved jobs
                  Expanded(
                      child: ListView.separated(
                          itemCount: context
                              .watch<HomeProvider>()
                              .state
                              .savedJobs
                              .length,
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 2.h,
                              color: AppColours.neutral200,
                            );
                          },
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.jobDetails,
                                    arguments: changeToDatum(
                                        context
                                            .read<HomeProvider>()
                                            .state
                                            .savedJobs[index],
                                        context));
                              },
                              child: SavedJobCard(
                                  job: changeToDatum(
                                      context
                                          .watch<HomeProvider>()
                                          .state
                                          .savedJobs[index],
                                      context)),
                            );
                          }),
                    )
            ]),
          ),
          context.watch<HomeProvider>().state.savedJobs.isEmpty
              ? //!  icon and text
              Center(
                  child: SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(AppAssets.ellipse5, scale: 1.2.sp),
                          Image.asset(AppAssets.ellipse6, scale: 1.2.sp),
                          Icon(Iconsax.bookmark_24,
                              size: 60.sp, color: AppColours.primary500)
                        ],
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 2.h,
                      ),
                      Text("Nothing has been saved yet",
                          style: TextStyle(
                              fontSize: 15.5.sp, fontWeight: FontWeight.w500)),
                      Divider(
                        color: Colors.transparent,
                        height: 2.h,
                      ),
                      Text("Press the star icon on the job you want to save.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColours.neutral500,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ))
              : const SizedBox(),
          context.watch<HomeProvider>().state.savedJobs.isEmpty
              ? Positioned(
                  top: 46.h,
                  right: 28.w,
                  child: Image.asset(
                    AppAssets.ellipse7,
                    scale: 1.2.sp,
                  ))
              : const SizedBox(),
          context.watch<HomeProvider>().state.savedJobs.isEmpty
              ? Positioned(
                  top: 39.h,
                  left: 23.w,
                  child: Image.asset(
                    AppAssets.ellipse8,
                    scale: 1.2.sp,
                  ))
              : const SizedBox(),
          context.watch<HomeProvider>().state.savedJobs.isEmpty
              ? Positioned(
                  top: 31.h,
                  right: 30.w,
                  child: Image.asset(AppAssets.ellipse9, scale: 1.2.sp))
              : const SizedBox()
        ],
      ),
    );
  }
}
