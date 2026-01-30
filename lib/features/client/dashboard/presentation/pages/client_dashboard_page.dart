import 'package:flutter/material.dart';

class ClientDashboardPage extends StatelessWidget {
  const ClientDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              spacing: 10,
              children: [
                Text(
                  'Job Overview',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.start,
                ),
                _buildJobCard(
                    Icons.work,
                    'Active Jobs',
                    'Description',
                    theme.colorScheme.secondary,
                    context,
                    trailing:  FilledButton(onPressed: () {}, child: Text('View Jobs')),
                ),
                _buildJobCard(Icons.work, 'Completed Jobs', 'Description', Colors.greenAccent, context,),
                _buildJobCard(Icons.work, 'Jobs Cancelled', 'Description', Colors.white, context,),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildJobCard(IconData icon, String title, String subtitle, Color color, BuildContext context, {Widget? trailing}) {
    return  Card(
      elevation: 3,
      color: color,
      child: Padding(
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
                    Icon(icon),
                    Text(title, style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const Spacer(),
            trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
