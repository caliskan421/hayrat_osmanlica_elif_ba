import 'package:go_router/go_router.dart';

import 'detail/detail_view.dart';
import 'home/home_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) => const DetailView(),
    )
  ],
);
