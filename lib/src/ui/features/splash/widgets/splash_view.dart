import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashViewModel splashViewModel = context.watch<SplashViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text(splashViewModel.title)),
      body: ListenableBuilder(
        listenable: splashViewModel,
        builder: (BuildContext context, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(splashViewModel.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => splashViewModel.navigateToDashboard(context),
                  child: const Text('Go to Dashboard'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
