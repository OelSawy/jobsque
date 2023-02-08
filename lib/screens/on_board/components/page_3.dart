import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colours.dart';
import '../provider/on_board_provider.dart';

class OnBoardPage3 extends StatelessWidget {
  const OnBoardPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset("assets/images/on_board/page 3/background.png"),
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
                      text: "Get the best",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text: " choice for the job",
                            style: TextStyle(color: AppColours.primary500)),
                        const TextSpan(text: " you've always dreamed of"),
                      ]),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 380,
                child: Text(
                    "The better the skills you have, the greater the good job opportunities for you.",
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
                    context.read<OnBoardProvider>().onBoardFinish(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.primary500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
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
