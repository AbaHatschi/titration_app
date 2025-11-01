import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/keg_line_view_model.dart';

class KegLineView extends StatelessWidget {
  const KegLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KegLineViewModel>(
      builder:
          (BuildContext context, KegLineViewModel kegLineViewModel, Widget? child) {
            return Scaffold(
              appBar: AppBar(title: Text(kegLineViewModel.title)),
              body: Center(child: Text(kegLineViewModel.welcomeMessage)),
            );
          },
    );
  }
}
