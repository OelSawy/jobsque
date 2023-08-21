import 'package:flutter/material.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/auth_models/get_profile_response_model.dart';
import 'package:jobsque/data/models/favorites_models/get_favorite_response_model.dart';
import 'package:jobsque/data/models/job_application_models/get_applied_jobs_response_model.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/data/models/job_models/show_jobs_response_model.dart';
import 'package:jobsque/data/models/job_models/show_suggested_jobs_response_model.dart';

class HomeState {
  //! jobs
  List<Datum> recentJobs = [];
  List<Datum> suggestedJobs = [];
  /* List<JobModel> suggestedJobs = [
    JobModel(
        name: "Product Designer",
        company: CompanyModel(
            name: "Zoom", location: "United States", image: AppAssets.zoomLogo),
        jobTime: "Fulltime",
        jobType: "Remote",
        jobCategory: "Design",
        salary: "12K-15K"),
    JobModel(
        name: "Product Designer",
        company: CompanyModel(
            name: "Stack",
            location: "United States",
            image: AppAssets.slackLogo),
        jobTime: "Fulltime",
        jobType: "Remote",
        jobCategory: "Design",
        salary: "12K-15K")
  ]; */
  /* List<JobModel> recentJobs = [
    JobModel(
        name: "Senior UI Designer",
        company: CompanyModel(
            name: "Twitter", location: "Jakarta", image: AppAssets.twitterLogo),
        jobTime: "Fulltime",
        jobType: "Remote",
        jobCategory: "Senior",
        salary: "15K"),
    JobModel(
        name: "Senior UX Designer",
        company: CompanyModel(
            name: "Discord", location: "Jakarta", image: AppAssets.discordLogo),
        jobTime: "Fulltime",
        jobType: "Remote",
        jobCategory: "Senior",
        salary: "15K")
  ]; */

  //! enums
  ChosenNavigationItem chosenNavigationItem = ChosenNavigationItem.home;
  SelectedJobDetailsSection selectedJobDetailsSection = SelectedJobDetailsSection.description;

  //! controllers
  final TextEditingController searchController = TextEditingController();

  //! search lists
  List<String> history = [];
  List<String> suggestions = [
    "UI/UX Designer",
    "Project Manager",
    "Product Designer",
    "UX Designer",
    "Front-End Developer"
  ];

  //! saved jobs
  List<DatumF> savedJobs = [];

  //! navigation index
  int navigationIndex = 0;

  //! responses
  ShowJobsResponseModel? showJobsResponseModel;
  ShowSuggestedJobsResponseModel? showSuggestedJobsResponseModel;

  LoadingState loadingState = LoadingState.initial;

  late User profile;

  LoadingState savedLoadingState = LoadingState.initial;

  bool notificationReceived = false;

  int jobTitleValue = 0;
  int locationValue = 0;
  int salaryValue = 0;
  int jobTypeValue = 0;
  int jobTimeValue = 0;
  int jobLocationValue = 0;
  int datePostedValue = 0;

  List<String> jobTypes = ["Job Type", "Job Type", "Job Type"];
  List<String> jobTimes = ["Full Time", "Part Time", "Internship"];
  List<String> jobLocations = ["Onsite", "Remote"];
  List<String> jobDates = ["Today", "This week", "This month", "This year"];

  List<Datum> results = [];
  List<Datum> filteredResults = [];
  List<DatumA> appliedJobs = [];

  LoadingState appliedLoadingState = LoadingState.initial;
}
