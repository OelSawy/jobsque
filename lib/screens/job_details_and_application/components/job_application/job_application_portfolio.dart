import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/assets.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../../core/colours.dart';
import '../../widgets/dotted_separator.dart';

class JobApplicationPortfolio extends StatelessWidget {
  const JobApplicationPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 96.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! header
                SizedBox(
                  height: 4.h,
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
                      child: Text("Apply for Job",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500)),
                    ),
                  ]),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! progress bar
                SizedBox(
                  height: 10.h,
                  width: 90.w,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 25.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColours.primary500,
                              child: const SizedBox.expand(
                                child: FittedBox(
                                  child: Icon(Icons.check_rounded,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text("Biodata",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    color: AppColours.primary500,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.transparent,
                            height: 3.5.h,
                          ),
                          DottedSeparator(dotColor: AppColours.primary500),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        // width: 25.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColours.primary500,
                              child: const SizedBox.expand(
                                child: FittedBox(
                                  child: Icon(Icons.check_rounded,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text("Type of Work",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    color: AppColours.primary500,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.transparent,
                            height: 3.5.h,
                          ),
                          DottedSeparator(dotColor: AppColours.primary500),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        // width: 25.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColours.primary500,
                              child: CircleAvatar(
                                radius: 19.sp,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColours.primary500,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Text("Upload portfolio",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    color: AppColours.primary500,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 3.h,
                ),
                Text("Upload portfolio",
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w500)),
                Divider(
                  color: Colors.transparent,
                  height: 1.h,
                ),
                Text(
                  "Fill in your bio data correctly",
                  style: TextStyle(
                      fontSize: 9.5.sp,
                      color: AppColours.neutral600,
                      fontWeight: FontWeight.w400),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                Text.rich(TextSpan(
                  text: "CV",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "*",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColours.danger500,
                            fontWeight: FontWeight.w400))
                  ],
                )),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                //! uploaded cv
                context.watch<JobDetailsProvider>().state.portfolio == null ?
                SizedBox() :
                Container(
                  width: 90.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.sp, color: AppColours.neutral300)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Image.asset(AppAssets.pdfLogo, scale: 1.sp),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        height: 6.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CV.pdf",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColours.neutral600,
                                    fontWeight: FontWeight.w400)),
                            Text("1.2MB",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColours.neutral600,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          iconSize: 20.sp,
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(
                            Iconsax.edit_24,
                            color: AppColours.primary500,
                          )),
                      IconButton(
                          iconSize: 20.sp,
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(
                            Iconsax.close_circle4,
                            color: AppColours.danger500,
                          ))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 4.h,
                ),
                DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 10],
                        color: AppColours.primary400,
                        strokeWidth: 1.sp,
                        child: context
                                    .watch<JobDetailsProvider>()
                                    .state
                                    .filePicking ==
                                FilePicking.initial
                            ? Container(
                                width: 90.w,
                                height: 30.h,
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(236, 242, 255, 100),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.sp,
                                      backgroundColor: AppColours.primary100,
                                      child: Icon(
                                        Iconsax.document_upload5,
                                        color: AppColours.primary500,
                                        size: 28.sp,
                                      ),
                                    ),
                                    Text("Upload your file",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                      "Max file size 10 MB",
                                      style: TextStyle(
                                          fontSize: 9.5.sp,
                                          color: AppColours.neutral500,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<JobDetailsProvider>()
                                            .addPortfolio();
                                      },
                                      child: Container(
                                          width: 80.w,
                                          height: 6.h,
                                          decoration: BoxDecoration(
                                              color: AppColours.primary100,
                                              border: Border.all(
                                                  width: 1.sp,
                                                  color: AppColours.primary500),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                  color: AppColours.primary500,
                                                  Iconsax.export_1),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Text(
                                                "Add File",
                                                style: TextStyle(
                                                    color:
                                                        AppColours.primary500,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ))
                            : context
                                        .watch<JobDetailsProvider>()
                                        .state
                                        .filePicking ==
                                    FilePicking.done
                                ? Container(
                                    width: 90.w,
                                    height: 30.h,
                                    padding: EdgeInsets.all(3.w),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          236, 242, 255, 100),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20.sp,
                                          backgroundColor:
                                              AppColours.primary100,
                                          backgroundImage: const AssetImage(
                                              AppAssets.pdfLogo),
                                        ),
                                        Text(
                                            basename(context
                                                .read<JobDetailsProvider>()
                                                .state
                                                .portfolio!
                                                .path),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                context
                                                    .read<JobDetailsProvider>()
                                                    .fileRemoved();
                                              },
                                              child: Container(
                                                  width: 80.w,
                                                  height: 6.h,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColours.danger100,
                                                      border: Border.all(
                                                          width: 1.sp,
                                                          color: AppColours
                                                              .danger500),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                          color: AppColours
                                                              .danger500,
                                                          Iconsax.trash4),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: AppColours
                                                                .danger500,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ))
                                : const SizedBox()),
                const Spacer(),
                //! submit button
                SizedBox(
                  width: 90.w,
                  height: 7.h,
                  child: ElevatedButton(
                    onPressed: () => context.read<JobDetailsProvider>().portfolioSubmitted(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.primary500,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
