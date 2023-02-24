import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/assets.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/colours.dart';

class CompanyPeople extends StatefulWidget {
  const CompanyPeople({super.key});

  @override
  State<CompanyPeople> createState() => _CompanyPeopleState();
}

class _CompanyPeopleState extends State<CompanyPeople> {
  int chosenItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Job Description",
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.w500)),
                Text(
                  "UI/UX Design",
                  style: TextStyle(
                      fontSize: 9.5.sp,
                      color: AppColours.neutral600,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              width: 40.w,
              height: 8.h,
              padding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 11.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColours.neutral300, width: 1.sp),
              ),
              alignment: Alignment.center,
              child: DropdownButtonFormField(
                isExpanded: true,
                isDense: true,
                style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColours.neutral600,
                    fontWeight: FontWeight.w500),
                value: chosenItem,
                borderRadius: BorderRadius.circular(50),
                decoration: const InputDecoration(border: InputBorder.none),
                icon: const Icon(Iconsax.arrow_down_14),
                items: const [
                  DropdownMenuItem(
                    value: 0,
                    child: Text("UI/UX Design"),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text("UI/UX Design"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("UI/UX Design"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    chosenItem = value as int;
                  });
                },
              ),
            )
          ],
        ),
        Divider(
          color: Colors.transparent,
          height: 2.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 90.w,
                height: 15.h,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.sp,
                      backgroundImage: const AssetImage(AppAssets.discordLogo),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      height: 10.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("John Doe",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500)),
                          Text("Senior UI/UX Designer\n at Twitter",
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: AppColours.neutral600,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 10.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Worked For",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral500)),
                          Text("5 Years",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  color: AppColours.primary500,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColours.neutral200,
                height: 0.5.h,
                thickness: 0.2.h,
              );
            },
            itemCount: 4),
        Divider(
          color: Colors.transparent,
          height: 15.h,
        ),
      ],
    );
  }
}
