import 'package:flutter/material.dart';

import 'job_card.dart';

class InProgressJobs extends StatelessWidget {
  const InProgressJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) => JobCard()
      ),
    );
  }
}
