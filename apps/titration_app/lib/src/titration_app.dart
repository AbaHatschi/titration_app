import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/routing.dart';

class TitrationApp extends StatelessWidget {
  const TitrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter router = context.watch<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Titration App',
      routerConfig: router.goRouter,
    );
  }
}
