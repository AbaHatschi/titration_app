import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/line_one_view_model.dart';

class LineOneView extends StatelessWidget {
  const LineOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineOneViewModel>(
      builder:
          (
            BuildContext context,
            LineOneViewModel lineOneViewModel,
            Widget? child,
          ) {
            return Scaffold(
              appBar: AppBar(title: Text(lineOneViewModel.title)),
              body: Center(child: Text(lineOneViewModel.welcomeMessage)),
            );
          },
    );
  }
}
