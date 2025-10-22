import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
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
            return ValueListenableBuilder<bool>(
              valueListenable: dashboardViewModel.navigateToSplash,
              builder:
                  (BuildContext context, bool shouldNavigate, Widget? child) {
                    if (shouldNavigate) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        SplashRoute().go(context);
                        dashboardViewModel.navigateToSplash.value =
                            false;
                      });
                    }
                    return Scaffold(
                      appBar: AppBar(title: Text(dashboardViewModel.title)),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(dashboardViewModel.message),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                dashboardViewModel.onSplashButtonPressed();
                              },
                              child: const Text('Go to Splash'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
            );
          },
    );
  }
}
