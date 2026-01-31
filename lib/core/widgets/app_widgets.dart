import 'package:field_techy/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_images.dart';

class AppWidgets {
  static Widget headlineWidget(BuildContext context, {required String text}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
      textAlign: TextAlign.start,
    );
  }

  static Widget appLogo(BuildContext context, {double? height, double? width}) {
    return SvgPicture.asset(
      AppImages.appLogo,
      height: height,
      width: width,
    );
  }

  static Widget gradientButton(
    BuildContext context, {
    required String text,
    required VoidCallback onPressed,
    Gradient? gradient,
    double width = double.infinity,
    double height = 50.0,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              colors: [
                AppTheme.startColor,
                Theme.of(context).primaryColor,
              ],
            ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Drawer appDrawer(BuildContext context) {
    return Drawer(
      child: Column(
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
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.person_outline,
                  text: 'Company Information',
                  onTap: () {},
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.folder_outlined,
                  text: 'Documents',
                  onTap: () {},
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.credit_card_outlined,
                  text: 'Payment Methods',
                  onTap: () {},
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.lock_outline,
                  text: 'Change Password',
                  onTap: () {},
                ),
                const Divider(),
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
      ),
    );
  }

  static Widget _buildDrawerHeader(BuildContext context) {
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

  static Widget _buildDrawerItem(
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
