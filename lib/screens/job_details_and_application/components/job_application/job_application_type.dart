
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/colours.dart';
import '../../widgets/dotted_separator.dart';

// ignore: must_be_immutable
class JobApplicationType extends StatefulWidget {
  JobApplicationType({super.key});

  List<String> types = ["Full Time", "Part Time", "Internship"];

  @override
  State<JobApplicationType> createState() => _JobApplicationTypeState();
}

class _JobApplicationTypeState extends State<JobApplicationType> {
  int radioValue = 0;

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
                              child: CircleAvatar(
                                radius: 19.sp,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColours.primary500,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Text("Type of work",
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
                          DottedSeparator(dotColor: AppColours.neutral400),
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
                              backgroundColor: AppColours.neutral400,
                              child: CircleAvatar(
                                radius: 19.sp,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColours.neutral400,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Text("Upload portfolio",
                                style: TextStyle(
                                    fontSize: 8.sp,
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
                Text("Type of Work",
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
                //! choices
                SizedBox(
                  width: 100.w,
                  height: 45.h,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              radioValue = index;
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.all(3.w),
                              height: 12.h,
                              decoration: BoxDecoration(
                                  color: radioValue == index ? AppColours.primary100 : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.sp, color: radioValue == index ? AppColours.primary500 : AppColours.neutral300)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.types.elementAt(index),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Radio(
                                    activeColor: AppColours.primary500,
                                    toggleable: false,
                                    value: index,
                                    groupValue: radioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        value == null ? null : radioValue = value;
                                      });
                                    },
                                  )
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.transparent,
                          height: 2.h,
                        );
                      },
                      itemCount: 3),
                ),
                const Spacer(),
                //! next button
                SizedBox(
                  width: 90.w,
                  height: 7.h,
                  child: ElevatedButton(
                    onPressed: () => context.read<JobDetailsProvider>().typeSubmitted(context, widget.types[radioValue]),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.primary500,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      "Next",
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
