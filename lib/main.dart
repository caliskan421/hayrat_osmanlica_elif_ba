import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/theme/light_theme.dart';
import 'package:hayrat_osmanlica_elif_ba/view/app_router.dart';

void main() {
  runApp(const OsmanlicaElifBaApp());
}

class OsmanlicaElifBaApp extends StatelessWidget {
  const OsmanlicaElifBaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      title: 'Osmalıca ElifBa',
      routerConfig: router,
    );
  }
}
