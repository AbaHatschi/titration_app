import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../view_model/line_two_view_model.dart';

class LineTwoView extends StatelessWidget {
  const LineTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineTwoViewModel>(
      builder:
          (
            BuildContext context,
            LineTwoViewModel lineTwoViewModel,
            Widget? child,
          ) {
            return ValueListenableBuilder<bool>(
              valueListenable: lineTwoViewModel.navigateToDashboard,
              builder:
                  (BuildContext context, bool shouldNavigate, Widget? child) {
                    if (shouldNavigate) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        DashboardRoute().go(context);
                        lineTwoViewModel.navigateToDashboard.value = false;
                      });
                    }
                    return Scaffold(
                      appBar: AppBar(title: Text(lineTwoViewModel.title)),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(lineTwoViewModel.message),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                lineTwoViewModel.onDashboardButtonPressed();
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
