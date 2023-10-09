import 'package:go_router/go_router.dart';
import 'package:softdesign_marvel/src/presenter/home/home_detail_scren.dart';
import 'package:softdesign_marvel/src/presenter/home/home_scren.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail/:character',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return HomeDetailScreen(data['character']);
      },
    ),
  ],
);
