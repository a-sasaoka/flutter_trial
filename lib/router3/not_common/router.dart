import 'package:flutter/material.dart';
import 'package:flutter_trial/router3/not_common/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@TypedGoRoute<Page1Route>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<Page3Route>(
      path: 'page3/:index',
    ),
  ],
)

/// Page1
@immutable
class Page1Route extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Page1();
  }
}

/// Page3
@immutable
class Page3Route extends GoRouteData {
  /// コンストラクタ
  const Page3Route({required this.index});

  /// index
  final int index;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Page3(
      index: index,
    );
  }
}

@TypedGoRoute<Page2Route>(
  path: '/page2',
)

/// Page2
@immutable
class Page2Route extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Page2();
  }
}

/// Routerを管理するProvider
@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: $appRoutes,
  );
}
