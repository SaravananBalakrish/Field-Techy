import 'package:flutter/material.dart';

class ClientDashboardPage extends StatelessWidget {
  const ClientDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 18,
          crossAxisAlignment: .start,
          children: [
            Text(
              'Job Overview',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.start,
            ),
            _buildJobCard(
                Icons.work,
                '12',
                'Active Jobs',
                theme.colorScheme.primary,
                context,
                trailing: FilledButton(onPressed: () {}, child: Text('View Jobs')),
              textColor: Colors.white
            ),
            Row(
              spacing: 18,
              children: [
                Expanded(child: _buildJobCard(Icons.work, '5', 'Completed Jobs', Color(0xffCBFBF1), context,)),
                Expanded(child: _buildJobCard(Icons.work, '3', 'Jobs Cancelled', Colors.grey.shade300, context,)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(IconData icon, String title, String subtitle, Color color, BuildContext context, {Widget? trailing, Color? textColor}) {
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
                  Icon(icon, color: textColor,),
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
}
