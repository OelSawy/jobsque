import 'package:flutter/material.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import 'job_card.dart';

// ignore: must_be_immutable
class RecentJobItem extends StatefulWidget {
  int? index;
  RecentJobItem({super.key, required this.index});

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return JobCard(
        job: (context.read<HomeProvider>().state.recentJobs[widget.index!]) as Datum);
  }
}