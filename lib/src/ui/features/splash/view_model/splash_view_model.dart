import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  final String title = 'Splash';
  String get message => 'Welcome to the Splash View!';

  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  @override
  void dispose() {
    navigateToDashboard.dispose();
    super.dispose();
  }
}
