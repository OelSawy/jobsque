import 'package:flutter/material.dart';
import 'package:jobsque/data/models/favorites_models/get_favorite_response_model.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/colours.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColours.primary500,
          ),
          Divider(
            color: Colors.transparent,
            height: 2.h,
          ),
          const Text("Loading ...")
        ],
      ),
    );
  }
}

Datum changeToDatum(DatumF job, BuildContext context) {
  return context.read<HomeProvider>().state.recentJobs.firstWhere((element) => element.id == job.jobId);
}