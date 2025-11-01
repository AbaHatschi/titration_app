import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/line_two_view_model.dart';

class LineTwoView extends StatelessWidget {
  const LineTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineTwoViewModel>(
      builder:
          (
            BuildContext context,
            LineTwoViewModel lineTwoViewModel,
            Widget? child,
          ) => Scaffold(
            appBar: AppBar(title: Text(lineTwoViewModel.title)),
            body: Center(child: Text(lineTwoViewModel.welcomeMessage)),
          ),
    );
  }
}
