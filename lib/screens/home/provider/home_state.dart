import 'package:flutter/material.dart';
import 'package:jobsque/core/assets.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/home_models/job_model.dart';

class HomeState {
  //! jobs
  List<JobModel> suggestedJobs = [
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
  ];
  List<JobModel> recentJobs = [
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
  ];

  //! enum navigation
  ChosenNavigationItem chosenNavigationItem = ChosenNavigationItem.home;

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
}
