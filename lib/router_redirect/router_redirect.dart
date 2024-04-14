import 'package:flutter/material.dart';
import 'package:flutter_trial/router_redirect/login_info.dart';
import 'package:flutter_trial/router_redirect/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_redirect.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<MenuRoute>(
      path: 'menu',
    ),
  ],
)

/// Home
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Home();
  }
}

/// Menu
@immutable
class MenuRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Menu();
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)

/// Login
@immutable
class LoginRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Login();
  }
}

/// Routerを管理するProvider
@Riverpod(keepAlive: true, dependencies: [])
GoRouter router(RouterRef ref) {
  final loginInfo = ref.watch(loginInfoProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      final loginLocation = LoginRoute().location;
      final goingToLogin = state.matchedLocation == loginLocation;

      // 未ログインでログイン画面以外を表示しようとした場合はログイン画面に遷移
      if (!loginInfo && !goingToLogin) {
        return LoginRoute().location;
      }

      // ログイン済みでログイン画面を表示しようとした場合はホーム画面に遷移
      if (loginInfo && goingToLogin) {
        return HomeRoute().location;
      }

      /// それ以外は指定された画面に遷移
      return null;
    },
  );
}
