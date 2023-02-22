import 'package:flutter/material.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/screens/home/components/home_applied.dart';
import 'package:jobsque/screens/home/components/home_messages.dart';
import 'package:jobsque/screens/home/components/home_profile.dart';
import 'package:jobsque/screens/home/components/home_saved.dart';
import 'package:jobsque/screens/home/provider/home_state.dart';

import '../components/home_home.dart';

class HomeProvider extends ChangeNotifier {
  HomeState state = HomeState();

  void onNavigationTap(int value) {
    switch (value) {
      case 0:
        state.chosenNavigationItem = ChosenNavigationItem.home;
        break;
      case 1:
        state.chosenNavigationItem = ChosenNavigationItem.messages;
        break;
      case 2:
        state.chosenNavigationItem = ChosenNavigationItem.applied;
        break;
      case 3:
        state.chosenNavigationItem = ChosenNavigationItem.saved;
        break;
      case 4:
        state.chosenNavigationItem = ChosenNavigationItem.profile;
        break;
    }
    notifyListeners();
  }

  Widget chosenPage() {
    switch (state.chosenNavigationItem) {
      case ChosenNavigationItem.home:
        return const Home();
      case ChosenNavigationItem.messages:
        return const Messages();
      case ChosenNavigationItem.applied:
        return const Applied();
      case ChosenNavigationItem.saved:
        return const Saved();
      case ChosenNavigationItem.profile:
        return const Profile();
    }
  }

  void clearHistoryItem(int index) {
    state.history.removeAt(index);
    notifyListeners();
  }
}
