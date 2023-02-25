import 'package:go_router/go_router.dart';

import 'package:learn_basic/screens/Auth.dart';
import 'package:learn_basic/screens/Home.dart';

class RootNavigation {
  static final router = GoRouter(
      initialLocation: "/auth",
      routes: [
        // GoRoute(path: "/splash", builder: (context, state) => Splash() ),
        GoRoute(path: '/', builder: (context, state) => Home()),
        GoRoute(path: '/auth', builder: (context, state) => Auth())
      ]);
}
