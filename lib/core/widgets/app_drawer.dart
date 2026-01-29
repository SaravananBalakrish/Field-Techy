import 'package:flutter/material.dart';

class AppDrawer extends Drawer {
  const AppDrawer({super.key}) : super(child: const _AppDrawerContent());
}

class _AppDrawerContent extends StatelessWidget {
  const _AppDrawerContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            addSemanticIndexes: true,
            padding: EdgeInsets.zero,
            children: <Widget>[
              _buildDrawerHeader(context),
              const SizedBox(height: 10),
              _buildDrawerItem(
                context,
                icon: Icons.article_outlined,
                text: 'Manage Proposal',
                onTap: () {},
              ),
              Divider(),
              _buildDrawerItem(
                context,
                icon: Icons.person_outline,
                text: 'Company Information',
                onTap: () {},
              ),
              Divider(),
              _buildDrawerItem(
                context,
                icon: Icons.folder_outlined,
                text: 'Documents',
                onTap: () {},
              ),
              Divider(),
              _buildDrawerItem(
                context,
                icon: Icons.credit_card_outlined,
                text: 'Payment Methods',
                onTap: () {},
              ),
              Divider(),
              _buildDrawerItem(
                context,
                icon: Icons.lock_outline,
                text: 'Change Password',
                onTap: () {},
              ),
              Divider(),
              _buildDrawerItem(
                context,
                icon: Icons.settings_outlined,
                text: 'Account Details',
                onTap: () {},
              ),
            ],
          ),
        ),
        _buildDrawerItem(
          context,
          icon: Icons.logout,
          text: 'Logout',
          onTap: () {},
          isLogout: true,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 30,
                // backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
              ),
              Positioned(
                bottom: 0,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'karthik',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text('Home Client', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text('4 Ratings | 10 Reviews', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    bool isLogout = false,
  }) {
    final color = isLogout ? Colors.red : Theme.of(context).textTheme.bodyLarge?.color;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      trailing: isLogout ? null : const Icon(Icons.chevron_right),
      style: ListTileStyle.drawer,
      onTap: onTap,
    );
  }
}
