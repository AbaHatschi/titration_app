import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../../../../routing/route_path.dart';
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
            return ValueListenableBuilder<String?>(
              valueListenable: dashboardViewModel.navigateTo,
              builder: (BuildContext context, String? route, Widget? child) {
                if (route != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    switch (route) {
                      case RoutePath.kegLine:
                        KegLineRoute().go(context);
                      case RoutePath.lineOne:
                        LineOneRoute().go(context);
                      case RoutePath.lineTwo:
                        LineTwoRoute().go(context);
                    }
                    dashboardViewModel.navigateTo.value = null;
                  });
                }
                return Scaffold(
                  appBar: AppBar(title: Text(dashboardViewModel.title)),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(dashboardViewModel.message),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            dashboardViewModel.onKegLineButtonPressed();
                          },
                          child: const Text('Go to Keg Line'),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Additional button action can be added here
                          },
                          child: const Text('Go to Line One'),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Additional button action can be added here
                          },
                          child: const Text('Go to Line Two'),
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
