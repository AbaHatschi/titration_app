import 'package:flutter/material.dart';

import '../../../../services/navigation_service.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel({required NavigationService navigationService})
    : _navigationService = navigationService;

  final NavigationService _navigationService;

  final String title = 'Splash';
  String get message => 'Welcome to the Splash View!';

  void navigateToDashboard(BuildContext context) =>
      _navigationService.navigateToDashboard(context);
}
