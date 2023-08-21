import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/favorites_models/get_favorite_response_model.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/data/services/auth_services/profile_services.dart';
import 'package:jobsque/data/services/favorites_services/favorites_services.dart';
import 'package:jobsque/data/services/job_application_services/job_application_services.dart';
import 'package:jobsque/data/services/job_services/job_services.dart';
import 'package:jobsque/screens/home/components/home_applied.dart';
import 'package:jobsque/screens/home/components/home_messages.dart';
import 'package:jobsque/screens/home/components/home_profile.dart';
import 'package:jobsque/screens/home/components/home_saved.dart';
import 'package:jobsque/screens/home/provider/home_state.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/auth_models/get_profile_response_model.dart';
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
        init();
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
  Widget chosenJobDetailsSection(Datum job) {
    switch (state.selectedJobDetailsSection) {
      case SelectedJobDetailsSection.description:
        return JobDescription(
          job: job,
        );
      case SelectedJobDetailsSection.company:
        return CompanyInfo(
          job: job,
        );
      case SelectedJobDetailsSection.people:
        return const CompanyPeople();
    }
  }

  //! search history delete item
  void clearHistoryItem(int index) {
    state.history.removeAt(index);
    notifyListeners();
  }

  void returnHome() {
    state.chosenNavigationItem = ChosenNavigationItem.home;
    state.navigationIndex = 0;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
    shared.setBool("registered", true);
    shared.setBool("onBoard", true);
    Restart.restartApp();
  }

  Future<void> init() async {
    state.loadingState = LoadingState.loading;
    notifyListeners();
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (shared.containsKey("profile")) {
      state.profile = userFromJson(shared.getString("profile")!);
    }
    state.showJobsResponseModel =
        await JobServices().getJobs(shared.getString("token")!);
    state.recentJobs = state.showJobsResponseModel!.data;
    /* state.showSuggestedJobsResponseModel = await JobServices()
        .showSuggestedJobs(shared.getString("id")!, shared.getString("token")!);
    state.suggestedJobs = state.showSuggestedJobsResponseModel!.data; */
    getSaved();
    getApplied();
    state.loadingState = LoadingState.done;
    notifyListeners();
  }

  Future<void> getApplied() async {
    state.appliedLoadingState = LoadingState.loading;
    notifyListeners();
    SharedPreferences shared = await SharedPreferences.getInstance();
    state.appliedJobs = (await JobApplicationServices().getAppliedJobs(shared.getString("id")!, shared.getString("token")!)).data;
    state.appliedLoadingState = LoadingState.done;
    notifyListeners();
  }

  Future<void> getSaved() async {
    state.savedLoadingState = LoadingState.loading;
    notifyListeners();
    SharedPreferences shared = await SharedPreferences.getInstance();
    GetFavoriteResponseModel getFavoriteResponseModel =
        await FavoritesServices()
            .getFavorite(shared.getString("id")!, shared.getString("token")!);
    if (getFavoriteResponseModel.runtimeType ==
        GetFavoriteResponseModelApproved) {
      state.savedJobs =
          (getFavoriteResponseModel as GetFavoriteResponseModelApproved).data;
    }
    state.savedLoadingState = LoadingState.done;
    notifyListeners();
  }

  void savedClicked(Datum? job) {
    for (int i = 0; i < state.savedJobs.length; i++) {
      if (state.savedJobs[i].jobId == job!.id) {
        removeFromSaved(state.savedJobs[i].id);
        notifyListeners();
        return;
      }
    }
    addToSaved(job);
  }

  Future<void> removeFromSaved(int id) async {
    state.savedJobs.removeWhere((element) => element.id == id);
    SharedPreferences shared = await SharedPreferences.getInstance();
    await FavoritesServices()
        .deleteFavorite(id.toString(), shared.getString("token")!);
  }

  Future<void> addToSaved(Datum? job) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await FavoritesServices().addFavorite(shared.getString("id")!,
        job!.id.toString(), shared.getString("token")!);
    getSaved();
    notifyListeners();
  }

  void resetFilters() {
    state.jobTitleValue = 0;
    state.locationValue = 0;
    state.salaryValue = 0;
    notifyListeners();
  }

  void jobTitleValueChanged(int? value) {
    state.jobTitleValue = value!;
    notifyListeners();
  }

  void locationValueChanged(int? value) {
    state.locationValue = value!;
    notifyListeners();
  }

  void salaryValueChanged(int? value) {
    state.salaryValue = value!;
    notifyListeners();
  }

  void jobTypeValueChanged(int? value) {
    state.jobTypeValue == value
        ? state.jobTypeValue = 0
        : state.jobTypeValue = value!;
    notifyListeners();
  }

  void jobTimeValueChanged(int? value) {
    state.jobTimeValue == value
        ? state.jobTimeValue = 0
        : state.jobTimeValue = value!;
    notifyListeners();
  }

  void jobLocationValueChanged(int? value) {
    state.jobLocationValue == value
        ? state.jobLocationValue = 0
        : state.jobLocationValue = value!;
    notifyListeners();
  }

  void datePostedValueChanged(int? value) {
    state.datePostedValue == value
        ? state.datePostedValue = 0
        : state.datePostedValue = value!;
    notifyListeners();
  }

  Future<void> updateProfile() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    state.loadingState = LoadingState.loading;
    notifyListeners();
    state.profile = (await ProfileServices()
            .getProfile(shared.getString("id")!, shared.getString("token")!))
        .data;
    shared.setString("profile", json.encode(state.profile.toJson()));
    state.loadingState = LoadingState.done;
    notifyListeners();
  }

  Future<void> search(String query) async {
    state.results = state.recentJobs
        .where((element) =>
            (element).name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void filterResults() {}
}
