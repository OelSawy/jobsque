import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DottedSeparator extends StatelessWidget {
  Color? dotColor;

  DottedSeparator({super.key, this.dotColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      //! Dashed line
      children: [
        for (int i = 0; i < 9; i++)
          Container(
            width: 1.w,
            height: 0.2.h,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.4.w,
                  color: i % 2 == 0 ? dotColor! : Colors.transparent,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
