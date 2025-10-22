import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  final String title = 'Dashboard';
  String get message => 'Welcome to the Dashboard!';

  final ValueNotifier<bool> navigateToSplash = ValueNotifier<bool>(false);

  void onSplashButtonPressed() {
    navigateToSplash.value = true;
  }
}
