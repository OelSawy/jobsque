import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import 'job_card.dart';

// ignore: must_be_immutable
class RecentJobItem extends StatelessWidget {
  int? index;
  RecentJobItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return JobCard(
        job: (context.read<HomeProvider>().state.recentJobs[index!]));
  }
}