import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/app_widgets.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xffE9E9E9)
        )
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            children: [
              AppWidgets.subHeadlineWidget(context, text: 'CCTV Installation'),
              const Spacer(),
              FilledButton(onPressed: () {}, child: Text('Onsite'))
            ],
          ),
          _buildRow(context, Icons.schedule_outlined, Constants.dateFormat.format(DateTime.now())),
          _buildRow(context, Icons.location_on_outlined, 'Chennai, Tamil Nadu, India'),
          _buildRow(context, Icons.calendar_month_outlined, '25 Feb 2026 – 31 Mar 2026 (5 weeks)'),
          _buildRow(context, Icons.home_repair_service, 'Service Category: Network Engineer'),
          _buildRow(context, Icons.money, '₹40,000'),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10,),
        Text(text),
      ],
    );
  }
}
