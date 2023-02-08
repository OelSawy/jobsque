import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:provider/provider.dart';

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
              Image.asset("assets/images/on_board/page 2/background.png"),
              const Divider(
                color: Colors.transparent,
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                width: 370,
                height: 160,
                child: Text.rich(
                  softWrap: true,
                  TextSpan(
                      text: "Hundreds of jobs are waiting for you to ",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text: "join together",
                            style: TextStyle(color: AppColours.primary500)),
                      ]),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 370,
                child: Text(
                    "Immediately join us and start applying for the job you are interested in.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColours.neutral500)),
              ),
              const Divider(
                color: Colors.transparent,
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        color: AppColours.primary200,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColours.primary500,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        color: AppColours.primary200,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
              const Divider(
                color: Colors.transparent,
                height: 25,
              ),
              SizedBox(
                width: 370,
                height: 50,
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
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              top: 60,
              left: 20,
              child: Image.asset(
                "assets/images/on_board/small logo.png",
                scale: 1.7,
              )),
          Positioned(
              top: 60,
              right: 20,
              child: InkWell(
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: AppColours.neutral500,
                      fontSize: 16,
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
