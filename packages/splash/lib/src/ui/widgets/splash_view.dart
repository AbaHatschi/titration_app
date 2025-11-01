import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            return Scaffold(
              appBar: AppBar(title: Text(splashViewModel.title)),
              body: Center(child: Text(splashViewModel.welcomeMessage)),
            );
          },
    );
  }
}
