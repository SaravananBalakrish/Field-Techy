import 'package:field_techy/features/client/dashboard/presentation/widgets/service_category_card.dart';
import 'package:flutter/material.dart';

class ServiceCategories extends StatelessWidget {
  const ServiceCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      childAspectRatio: 0.7,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ServiceCategoryCard(
          image: 'assets/jpg/service_categories/maintenance.jpg',
          name: 'Maintenance',
          count: '20+ Engineers',
        ),
        ServiceCategoryCard(
          image: 'assets/jpg/service_categories/teaching.jpg',
          name: 'Teaching',
          count: '10+ Engineers',
        ),
        ServiceCategoryCard(
          image: 'assets/jpg/service_categories/networks.jpg',
          name: 'Networks',
          count: '20+ Engineers',
        ),
        ServiceCategoryCard(
          image: 'assets/jpg/service_categories/support.jpg',
          name: 'Support',
          count: '10+ Engineers',
        ),
      ],
    );
  }
}
