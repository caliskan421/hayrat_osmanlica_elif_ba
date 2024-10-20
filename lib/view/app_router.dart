import 'package:go_router/go_router.dart';

import '../model/ders_model.dart';
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
      builder: (context, state) {
        final aktifDersModel = state.extra as DersModel;
        return DetailView(aktifDersModel: aktifDersModel);
      },
    )
  ],
);
