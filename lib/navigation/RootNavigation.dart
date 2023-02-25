import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:learn_basic/screens/Auth.dart';
import 'package:learn_basic/screens/Home.dart';

import '../utils/getUserData.dart';

class RootNavigation {
  static final router = GoRouter(
      initialLocation: "/auth",
      redirect: (BuildContext context, GoRouterState state) {
        if (state.location == "/auth") {
          Future<String?> checkIsAuthorizated() async {
            final userData = await getUserData();
            if (userData != null) {
              return "/";
            }
            return null;
          }

          return checkIsAuthorizated();
        }

      },
      routes: [
        // GoRoute(path: "/splash", builder: (context, state) => Splash() ),
        GoRoute(path: '/', builder: (context, state) => Home()),
        GoRoute(path: '/auth', builder: (context, state) => Auth())
      ]);
      
}
