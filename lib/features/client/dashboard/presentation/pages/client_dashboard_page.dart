import 'package:field_techy/core/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/in_progress_jobs.dart';
import '../widgets/service_categories.dart';

class ClientDashboardPage extends StatelessWidget {
  const ClientDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        AppWidgets.searchInput(context, onChanged: (value) {}),
        SizedBox(height: 20,),
        _buildJobOverviewCard(context),
        SizedBox(height: 30,),
        _buildServiceCategoryCard(context),
        SizedBox(height: 30,),
        _buildInProgressJobsCard(context),
      ],
    );
  }

  Widget _buildJobOverviewCard(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        AppWidgets.headlineWidget(context, text: 'Job Overview'),
        SizedBox(height: 12,),
        _buildJobCard(
            '12',
            'Active Jobs',
            Theme.of(context).colorScheme.primary,
            context,
            trailing: FilledButton(onPressed: () {}, child: Text('View Jobs')),
            textColor: Colors.white
        ),
        SizedBox(height: 18),
        Row(
          spacing: 18,
          children: [
            Expanded(child: _buildJobCard('5', 'Completed Jobs', Color(0xffCBFBF1), context, textColor: Colors.black)),
            Expanded(child: _buildJobCard('3', 'Jobs Cancelled', Colors.grey.shade300, context, textColor: Colors.black)),
          ],
        )
      ],
    );
  }

  Widget _buildJobCard(String title, String subtitle, Color color, BuildContext context, {Widget? trailing, Color? textColor}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10,
                children: [
                  Icon(Icons.cases_outlined, color: textColor,),
                  Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: textColor)),
                ],
              ),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor)),
            ],
          ),
          const Spacer(),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildServiceCategoryCard(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Row(
          children: [
            AppWidgets.headlineWidget(context, text: 'Service Categories'),
            const Spacer(),
            FilledButton(onPressed: () {}, child: Text('View All'))
          ],
        ),
        const SizedBox(height: 16),
        ServiceCategories()
      ],
    );
  }

  Widget _buildInProgressJobsCard(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 5,
      children: [
        Row(
          children: [
            AppWidgets.headlineWidget(context, text: 'In Progress Jobs'),
            const Spacer(),
            FilledButton(onPressed: () {}, child: Text('View All'))
          ],
        ),
        InProgressJobs()
      ],
    );
  }
}
