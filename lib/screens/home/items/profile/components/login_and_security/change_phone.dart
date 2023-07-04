import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/colours.dart';
import '../../provider/profile_provider.dart';

class ChangePhone extends StatelessWidget {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: 96.4.h,
          child: Column(
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
                          "Phone number",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColours.neutral900),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(height: 3.h, color: Colors.transparent),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Main phone number",
                            style: TextStyle(
                                color: AppColours.neutral400,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 2.h,
                          bottom: 3.h,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 9.h,
                        width: 90.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1.sp, color: AppColours.neutral300)),
                        child: InternationalPhoneNumberInput(
                          countrySelectorScrollControlled: false,
                          onSaved:
                              context.read<ProfileProvider>().onPhoneChange,
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          onInputChanged:
                              context.read<ProfileProvider>().onPhoneChange,
                          inputBorder: InputBorder.none,
                        ),
                      ),
                      Divider(height: 1.h, color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 60.w,
                            child: Text(
                              "Use the phone number to reset your password",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral500),
                            ),
                          ),
                          Switch.adaptive(
                            value: context
                                .watch<ProfileProvider>()
                                .state
                                .phoneToResetPass,
                            onChanged: context
                                .read<ProfileProvider>()
                                .phoneToResetPassChange,
                          )
                        ],
                      ),
                      const Spacer(),
                      //! save button
                      SizedBox(
                        width: 90.w,
                        height: 7.h,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ProfileProvider>().checkPhone() == true
                                ? context
                                    .read<ProfileProvider>()
                                    .savePhone(context)
                                : null;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: context
                                          .read<ProfileProvider>()
                                          .checkPhone() ==
                                      true
                                  ? AppColours.primary500
                                  : AppColours.neutral300,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: context
                                            .read<ProfileProvider>()
                                            .checkPhone() ==
                                        true
                                    ? Colors.white
                                    : AppColours.neutral500,
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
