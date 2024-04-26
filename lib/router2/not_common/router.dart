import 'package:flutter/material.dart';
import 'package:flutter_trial/router2/common/router_common.dart' as common;
import 'package:flutter_trial/router2/not_common/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@TypedGoRoute<Page1Route>(
  path: '/',
  name: 'page1',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<Page3Route>(
      path: 'page3/:index',
      name: 'page3',
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

  /// インデックス
  final int index;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Page3(
      index: index,
    );
  }
}

/// Routerを管理するProvider
@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final routes = $appRoutes + common.$appRoutes;

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: routes,
  );
}
