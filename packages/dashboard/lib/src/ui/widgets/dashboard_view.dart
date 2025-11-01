import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder:
          (
            BuildContext context,
            DashboardViewModel dashboardViewModel,
            Widget? child,
          ) {
            return Scaffold(
              appBar: AppBar(title: Text(dashboardViewModel.title)),
              body: Center(child: Text(dashboardViewModel.welcomeMessage)),
            );
          },
    );
  }
}
