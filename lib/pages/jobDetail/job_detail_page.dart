import 'package:flutter/material.dart';
import 'package:jobportal/pages/jobDetail/widgets/buttons_widget.dart';
import 'package:jobportal/utils/colors.dart';

import '../../models/job_model.dart';
import 'widgets/cardJobDescription_widget.dart';
import 'widgets/cardJobDetail_widget.dart';
import 'widgets/cardJobRole_widget.dart';
import 'widgets/cardJobSkills_widget.dart';
import 'widgets/head_widget.dart';

class JobDetailPage extends StatelessWidget {
  const JobDetailPage({
    super.key,
    required this.job,
  });

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Head(),
                CardJobDetail(job: job),
                const SizedBox(height: 30),
                CardJobDescription(job: job),
                const SizedBox(height: 30),
                CardJobSkills(job: job),
                const SizedBox(height: 30),
                CardJobRole(job: job),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const Buttons(),
    );
  }
}
