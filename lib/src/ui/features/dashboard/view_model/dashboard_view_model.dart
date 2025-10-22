import 'package:flutter/material.dart';

import '../../../../services/navigation_service.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel({required NavigationService navigationService})
    : _navigationService = navigationService;

  final NavigationService _navigationService;

  final String title = 'Dashboard';
  String get message => 'Welcome to the Dashboard!';

  void navigateToSplash(BuildContext context) =>
      _navigationService.navigateToSplash(context);
}
