import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/on_board/provider/on_board_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardProvider extends ChangeNotifier {
  OnBoardState state = OnBoardState();

  Future<void> onBoardFinish(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool("onBoard", true);
    if (context.mounted) {
      // Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
      Navigator.of(context).pushNamed(AppRoutes.createAccount);
    }
  }
}