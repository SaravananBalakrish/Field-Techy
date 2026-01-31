import 'package:field_techy/features/client/dashboard/presentation/pages/client_dashboard_page.dart';
import 'package:go_router/go_router.dart';

class ClientDashboardRoutes {
  static final dashboardRouteName = 'clientDashboard';
  static final dashboardPath = '/';
  static final dashboard =  GoRoute(
    path: dashboardPath,
    builder: (context, state) => const ClientDashboardPage(),
  );
}