import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../view_model/keg_line_view_model.dart';

class KegLineView extends StatelessWidget {
  const KegLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KegLineViewModel>(
      builder:
          (
            BuildContext context,
            KegLineViewModel kegLineViewModel,
            Widget? child,
          ) {
            return ValueListenableBuilder<bool>(
              valueListenable: kegLineViewModel.navigateToDashboard,
              builder:
                  (BuildContext context, bool shouldNavigate, Widget? child) {
                    if (shouldNavigate) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        DashboardRoute().go(context);
                        kegLineViewModel.navigateToDashboard.value = false;
                      });
                    }
                    return Scaffold(
                      appBar: AppBar(title: Text(kegLineViewModel.title)),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(kegLineViewModel.message),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                kegLineViewModel.onDashboardButtonPressed();
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
