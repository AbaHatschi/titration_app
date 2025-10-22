import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardViewModel homeViewModel = context
        .watch<DashboardViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text(homeViewModel.title)),
      body: ListenableBuilder(
        listenable: homeViewModel,
        builder: (BuildContext context, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(homeViewModel.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => homeViewModel.navigateToSplash(context),
                  child: const Text('Go to Splash Screen'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
