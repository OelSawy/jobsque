import 'package:flutter/material.dart';
import 'package:jobsque/screens/user_handling/create_account/provider/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/colours.dart';
import '../widgets/widgets.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  bool choice1 = true;
  bool choice2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SizedBox(
          height: 100.h,
          width: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              Text("What are your prefered Locations?",
                  softWrap: true,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              Text(
                  "Let us know, where is the work location you want at this time, so we can adjust it.",
                  softWrap: true,
                  style: TextStyle(
                      color: AppColours.neutral500,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400)),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              Container(
                  width: 90.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: AppColours.neutral100,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            choice1 = !choice1;
                            choice2 = !choice2;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 45.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: choice1
                                    ? AppColours.primary900
                                    : AppColours.neutral100,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text("Work from office",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: choice1
                                        ? Colors.white
                                        : AppColours.neutral500))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            choice1 = !choice1;
                            choice2 = !choice2;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 45.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: choice2
                                    ? AppColours.primary900
                                    : AppColours.neutral100,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text("Remote work",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: choice2
                                        ? Colors.white
                                        : AppColours.neutral500))),
                      ),
                    ],
                  )),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              Text("Select the country you want for your job",
                  softWrap: true,
                  style: TextStyle(
                      color: AppColours.neutral500,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400)),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              //! countries selector
              Expanded(
                  child: SingleChildScrollView(
                child: Wrap(
                  spacing: 3.w,
                  runSpacing: 3.w,
                  children: getCountries(context),
                ),
              )),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              //! next button
              SizedBox(
                width: 90.w,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (context
                        .read<CreateAccountProvider>()
                        .state
                        .selectedCountries
                        .isNotEmpty) {
                      if (choice1) {
                        context
                            .read<CreateAccountProvider>()
                            .profileDone("office", context);
                      } else {
                        context
                            .read<CreateAccountProvider>()
                            .profileDone("remote", context);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Select at least one country")));
                    }
                  },
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
                height: 4.h,
              )
            ],
          ),
        ),
      )),
    );
  }
}
