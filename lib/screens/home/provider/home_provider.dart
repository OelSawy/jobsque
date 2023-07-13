import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/services/job_services/job_services.dart';
import 'package:jobsque/screens/home/components/home_applied.dart';
import 'package:jobsque/screens/home/components/home_messages.dart';
import 'package:jobsque/screens/home/components/home_profile.dart';
import 'package:jobsque/screens/home/components/home_saved.dart';
import 'package:jobsque/screens/home/provider/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        state.navigationIndex = 0;
        break;
      case 1:
        state.chosenNavigationItem = ChosenNavigationItem.messages;
        state.navigationIndex = 1;
        break;
      case 2:
        state.chosenNavigationItem = ChosenNavigationItem.applied;
        state.navigationIndex = 2;
        break;
      case 3:
        state.chosenNavigationItem = ChosenNavigationItem.saved;
        state.navigationIndex = 3;
        break;
      case 4:
        state.chosenNavigationItem = ChosenNavigationItem.profile;
        state.navigationIndex = 4;
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

  //! save job
  /* void saveJob(JobModel jobModel) {
    state.savedJobs.add(jobModel);
    notifyListeners();
  }

  void removeSavedJob(JobModel? job) {
    state.savedJobs.remove(job);
    notifyListeners();
  } */

  void returnHome() {
    state.chosenNavigationItem = ChosenNavigationItem.home;
    state.navigationIndex = 0;
    notifyListeners();
  }

  logout() {}

  Future<void> init() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    state.showJobsResponseModel = await JobServices().getJobs(shared.getString("token")!);
    state.recentJobs = state.showJobsResponseModel!.data;
    log(state.showJobsResponseModel!.data.first.name);
    state.showSuggestedJobsResponseModel = await JobServices().showSuggestedJobs(shared.getString("id")!, shared.getString("token")!);
    state.suggestedJobs = state.showSuggestedJobsResponseModel!.data;
  }
}
