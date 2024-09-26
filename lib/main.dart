import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/view/app_router.dart';

import 'theme/light_theme.dart';

void main() {
  runApp(const OsmanlicaElifbaApp());
}

class OsmanlicaElifbaApp extends StatelessWidget {
  const OsmanlicaElifbaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Osmanlıca ElifBa',
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
