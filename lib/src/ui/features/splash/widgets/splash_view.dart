import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashViewModel>(
      builder:
          (
            BuildContext context,
            SplashViewModel splashViewModel,
            Widget? child,
          ) {
            return ValueListenableBuilder<bool>(
              valueListenable: splashViewModel.navigateToDashboard,
              builder:
                  (BuildContext context, bool shouldNavigate, Widget? child) {
                    if (shouldNavigate) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        DashboardRoute().go(context);
                        splashViewModel.navigateToDashboard.value =
                            false;
                      });
                    }
                    return Scaffold(
                      appBar: AppBar(title: Text(splashViewModel.title)),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(splashViewModel.message),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                splashViewModel.onDashboardButtonPressed();
                              },
                              child: const Text('Go to Dashboard'),
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
