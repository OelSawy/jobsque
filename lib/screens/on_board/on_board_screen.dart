import 'package:flutter/material.dart';
import 'package:jobsque/screens/on_board/provider/on_board_provider.dart';
import 'package:provider/provider.dart';

import 'components/page_1.dart';
import 'components/page_2.dart';
import 'components/page_3.dart';

// ignore: must_be_immutable
class OnBoardScreen extends StatelessWidget {
  List<Widget> pages = [
    const OnBoardPage1(),
    const OnBoardPage2(),
    const OnBoardPage3(),
  ];

  OnBoardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: context.read<OnBoardProvider>().state.pageController,
            children: pages));
  }
}
