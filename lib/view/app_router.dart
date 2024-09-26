import 'package:go_router/go_router.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/home_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) => const HomeView(),
    ),
  ],
);
