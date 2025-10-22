import 'package:flutter/material.dart';

import '../../../../routing/route_path.dart';

class DashboardViewModel extends ChangeNotifier {
  final String title = 'Dashboard';
  String get message => 'Welcome to the Dashboard!';

  final ValueNotifier<String?> navigateTo = ValueNotifier<String?>(null);

  void onKegLineButtonPressed() {
    navigateTo.value = RoutePath.kegLine;
  }

  void onLineOneButtonPressed() {
    navigateTo.value = RoutePath.lineOne;
  }

  void onLineTwoButtonPressed() {
    navigateTo.value = RoutePath.lineTwo;
  }
}
