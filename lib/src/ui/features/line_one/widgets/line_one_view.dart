import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../view_model/line_one_view_model.dart';

class LineOneView extends StatelessWidget {
  const LineOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineOneViewModel>(
      builder:
          (
            BuildContext context,
            LineOneViewModel lineOneViewModel,
            Widget? child,
          ) {
            return ValueListenableBuilder<bool>(
              valueListenable: lineOneViewModel.navigateToDashboard,
              builder:
                  (BuildContext context, bool shouldNavigate, Widget? child) {
                    if (shouldNavigate) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        DashboardRoute().go(context);
                        lineOneViewModel.navigateToDashboard.value = false;
                      });
                    }
                    return Scaffold(
                      appBar: AppBar(title: Text(lineOneViewModel.title)),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(lineOneViewModel.message),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                lineOneViewModel.onDashboardButtonPressed();
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
