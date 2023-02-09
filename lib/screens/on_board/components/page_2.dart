import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../provider/on_board_provider.dart';

class OnBoardPage2 extends StatelessWidget {
  const OnBoardPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Container(
                width: 100.w,
                height: 50.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/on_board/page 2/background.png"),
                        fit: BoxFit.fitWidth)),
              ),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 90.w,
                height: 18.h,
                child: Text.rich(
                  softWrap: true,
                  TextSpan(
                      text: "Hundreds of jobs are waiting for you to ",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text: "join together",
                            style: TextStyle(color: AppColours.primary500)),
                      ]),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 1.5.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 90.w,
                child: Text(
                    "Immediately join us and start applying for the job you are interested in.",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColours.neutral500)),
              ),
              Divider(
                color: Colors.transparent,
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1.8.w,
                    height: 1.8.w,
                    decoration: BoxDecoration(
                        color: AppColours.primary200,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 1.2.w,
                  ),
                  Container(
                    width: 2.5.w,
                    height: 2.5.w,
                    decoration: BoxDecoration(
                        color: AppColours.primary500,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 1.2.w,
                  ),
                  Container(
                    width: 1.8.w,
                    height: 1.8.w,
                    decoration: BoxDecoration(
                        color: AppColours.primary200,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
              Divider(
                color: Colors.transparent,
                height: 5.h,
              ),
              SizedBox(
                width: 90.w,
                height: 6.h,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<OnBoardProvider>()
                        .state
                        .pageController
                        .nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
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
              )
            ],
          ),
          Positioned(
              top: 6.5.h,
              left: 5.w,
              child: Image.asset(
                "assets/images/components/small logo.png",
                scale: 1.7,
              )),
          Positioned(
              top: 6.5.h,
              right: 5.w,
              child: InkWell(
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: AppColours.neutral500,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () =>
                    context.read<OnBoardProvider>().onBoardFinish(context),
              ))
        ],
      ),
    );
  }
}
