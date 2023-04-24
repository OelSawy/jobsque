import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/assets.dart';
import '../../../../../core/colours.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! header
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      iconSize: 20.sp,
                      icon: const Icon(Iconsax.arrow_left4),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Portfolio",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColours.neutral900),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(height: 2.h, color: Colors.transparent),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                  child: Text(
                    "Add portfolio here",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColours.neutral900),
                  ),
                ),
                Divider(height: 1.h, color: Colors.transparent),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 10],
                  color: AppColours.primary400,
                  strokeWidth: 1.sp,
                  child: Container(
                      width: 90.w,
                      height: 30.h,
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(236, 242, 255, 100),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Text("Upload your other file",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                          Text(
                            "Max. file size 10 MB",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                color: AppColours.neutral500,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                width: 80.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                    color: AppColours.primary100,
                                    border: Border.all(
                                        width: 1.sp,
                                        color: AppColours.primary500),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                          color: AppColours.primary500,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )),
                ),
                Divider(height: 4.h, color: Colors.transparent),
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
                  height: 1.h,
                ),
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
                  height: 1.h,
                ),
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
              ],
            ),
          )
        ],
      )),
    );
  }
}
