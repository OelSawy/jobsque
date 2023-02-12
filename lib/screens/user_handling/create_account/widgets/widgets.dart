import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/user_handling/create_account/provider/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CategoryChoice extends StatefulWidget {
  final int? index;

  const CategoryChoice({super.key, required this.index});

  @override
  State<CategoryChoice> createState() => _CategoryChoiceState();
}

class _CategoryChoiceState extends State<CategoryChoice> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CreateAccountProvider>().selectCategory(widget.index!);
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
          padding: EdgeInsets.only(left: 10.sp, right: 0.sp),
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              color: isTapped ? AppColours.primary100 : AppColours.neutral100,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isTapped ? AppColours.primary500 : AppColours.neutral300,
                width: 2.sp,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColours.neutral300,
                radius: 20.sp,
                child: CircleAvatar(
                  radius: 18.sp,
                  backgroundColor: AppColours.neutral100,
                  foregroundColor:
                      isTapped ? AppColours.primary500 : AppColours.neutral300,
                  child: context
                      .read<CreateAccountProvider>()
                      .state
                      .categories
                      .values
                      .elementAt(widget.index!)
                      .values
                      .elementAt(0),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 2.h,
              ),
              Text(
                context
                    .read<CreateAccountProvider>()
                    .state
                    .categories
                    .values
                    .elementAt(widget.index!)
                    .values
                    .elementAt(1),
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              )
            ],
          )),
    );
  }
}

class CountryChoice extends StatefulWidget {
  final int? index;

  const CountryChoice({super.key, required this.index});

  @override
  State<CountryChoice> createState() => _CountryChoiceState();
}

class _CountryChoiceState extends State<CountryChoice> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<CreateAccountProvider>().selectCountry(widget.index!);
          setState(() {
            isTapped = !isTapped;
          });
        },
        child: Container(
            padding: EdgeInsets.all(5.sp),
            height: 7.h,
            decoration: BoxDecoration(
                color: isTapped ? AppColours.primary100 : AppColours.neutral100,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color:
                      isTapped ? AppColours.primary500 : AppColours.neutral300,
                  width: 2.sp,
                )),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 15.sp,
                  backgroundImage: AssetImage(context
                      .read<CreateAccountProvider>()
                      .state
                      .countries
                      .values
                      .elementAt(widget.index!)
                      .values
                      .elementAt(1)),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  context
                      .read<CreateAccountProvider>()
                      .state
                      .countries
                      .values
                      .elementAt(widget.index!)
                      .values
                      .elementAt(0),
                  style: const TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            )));
  }
}

List<Widget> getCountries(BuildContext context) {
  List<Widget> countries = [];
  for (int i = 0;
      i < context.read<CreateAccountProvider>().state.countries.values.length;
      i++) {
    countries.add(CountryChoice(index: i));
  }
  return countries;
}
