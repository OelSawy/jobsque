import 'package:flutter/material.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/screens/home/components/home_applied.dart';
import 'package:jobsque/screens/home/components/home_messages.dart';
import 'package:jobsque/screens/home/components/home_profile.dart';
import 'package:jobsque/screens/home/components/home_saved.dart';
import 'package:jobsque/screens/home/provider/home_state.dart';

import '../../job_details_and_application/components/company_people.dart';
import '../../job_details_and_application/components/company_info.dart';
import '../../job_details_and_application/components/job_description.dart';
import '../components/home_home.dart';

class HomeProvider extends ChangeNotifier {
  HomeState state = HomeState();

  //! navigation bar item pressed
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

  //! home body
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

  //! job details body 
  Widget chosenJobDetailsSection() {
    switch (state.selectedJobDetailsSection) {
      case SelectedJobDetailsSection.description:
        return const JobDescription();
      case SelectedJobDetailsSection.company:
        return const CompanyInfo();
      case SelectedJobDetailsSection.people:
        return const CompanyPeople();
    }
  }

  //! search history delete item
  void clearHistoryItem(int index) {
    state.history.removeAt(index);
    notifyListeners();
  }
}
