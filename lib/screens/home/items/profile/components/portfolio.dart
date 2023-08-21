import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/assets.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/portfolio_models/get_portfolio_response_model.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:jobsque/screens/home/widgets/misc_widgets.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/colours.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: 96.4.h,
        child: SingleChildScrollView(
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
                        child: context
                                    .watch<ProfileProvider>()
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
                                            .read<ProfileProvider>()
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
                                        .watch<ProfileProvider>()
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
                                                .read<ProfileProvider>()
                                                .state
                                                .cvFile!
                                                .path),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                          "Ready to upload",
                                          style: TextStyle(
                                              fontSize: 9.5.sp,
                                              color: AppColours.neutral500,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                context
                                                    .read<ProfileProvider>()
                                                    .fileRemoved();
                                              },
                                              child: Container(
                                                  width: 40.w,
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
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                context
                                                    .read<ProfileProvider>()
                                                    .uploadPortfolio();
                                              },
                                              child: Container(
                                                  width: 40.w,
                                                  height: 6.h,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColours.primary100,
                                                      border: Border.all(
                                                          width: 1.sp,
                                                          color: AppColours
                                                              .primary500),
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
                                                              .primary500,
                                                          Iconsax.export_1),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        "Upload",
                                                        style: TextStyle(
                                                            color: AppColours
                                                                .primary500,
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
                    Divider(height: 4.h, color: Colors.transparent),
                    context
                                .watch<ProfileProvider>()
                                .state
                                .portfolioLoadingState ==
                            LoadingState.loading
                        ? SizedBox(height: 40.h, child: const Loading())
                        : context
                                .read<ProfileProvider>()
                                .state
                                .portfolios
                                .isEmpty
                            ? const SizedBox()
                            : SizedBox(
                                width: 100.w,
                                height: 40.h,
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      Datum portfolio = context
                                          .read<ProfileProvider>()
                                          .state
                                          .portfolios[index];
                                      return Container(
                                        width: 90.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1.sp,
                                                color: AppColours.neutral300)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Image.asset(AppAssets.pdfLogo,
                                                scale: 1.sp),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(portfolio.name,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: AppColours
                                                              .neutral600,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  Text("--size here--",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color: AppColours
                                                              .neutral600,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                                iconSize: 20.sp,
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return SimpleDialog(
                                                        title: Text(
                                                          "Enter new portfolio name",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: AppColours
                                                                  .neutral900,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        children: [
                                                          Container(
                                                            width: 80.w,
                                                            height: 20.h,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.sp)),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              4.w),
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top: 2
                                                                              .h,
                                                                          bottom:
                                                                              2.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 7.h,
                                                                  width: 60.w,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      border: Border.all(
                                                                          width: 1.sp,
                                                                          color: context.watch<ProfileProvider>().state.portfolioName == null
                                                                              ? AppColours.neutral300
                                                                              : context.watch<ProfileProvider>().state.portfoioNameErrorMessage != null
                                                                                  ? AppColours.danger500
                                                                                  : AppColours.primary500)),
                                                                  child:
                                                                      TextField(
                                                                    controller: context
                                                                        .read<
                                                                            ProfileProvider>()
                                                                        .state
                                                                        .portfolioController,
                                                                    onChanged: context
                                                                        .read<
                                                                            ProfileProvider>()
                                                                        .onPortfolioNameChange,
                                                                    onSubmitted: context
                                                                        .read<
                                                                            ProfileProvider>()
                                                                        .onPortfolioNameChange,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14.sp),
                                                                    decoration: const InputDecoration(
                                                                        border: InputBorder
                                                                            .none,
                                                                        hintText:
                                                                            "Portfolio name"),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 1.h,
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                context
                                                                            .watch<ProfileProvider>()
                                                                            .state
                                                                            .portfoioNameErrorMessage ==
                                                                        null
                                                                    ? const SizedBox()
                                                                    : Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 4.w),
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            context.watch<ProfileProvider>().state.portfoioNameErrorMessage!,
                                                                            style: TextStyle(
                                                                                fontSize: 10.sp,
                                                                                color: AppColours.danger500,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor: context.read<ProfileProvider>().validatePortfolioName() ==
                                                                              true
                                                                          ? AppColours
                                                                              .primary500
                                                                          : AppColours
                                                                              .neutral300,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      if (context
                                                                              .read<ProfileProvider>()
                                                                              .validatePortfolioName() ==
                                                                          true) {
                                                                        context
                                                                            .read<ProfileProvider>()
                                                                            .updatePortfolio(index);
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      } else {
                                                                        null;
                                                                      }
                                                                    },
                                                                    child: const Text(
                                                                        "save"))
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                color: Colors.white,
                                                icon: Icon(
                                                  Iconsax.edit_24,
                                                  color: AppColours.primary500,
                                                )),
                                            IconButton(
                                                iconSize: 20.sp,
                                                onPressed: () {
                                                  context
                                                      .read<ProfileProvider>()
                                                      .deletePortfolio();
                                                },
                                                color: Colors.white,
                                                icon: Icon(
                                                  Iconsax.close_circle4,
                                                  color: AppColours.danger500,
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                          height: 1.h,
                                          color: Colors.transparent);
                                    },
                                    itemCount: context
                                        .read<ProfileProvider>()
                                        .state
                                        .portfolios
                                        .length),
                              )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
