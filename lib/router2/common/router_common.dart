import 'package:flutter/material.dart';
import 'package:flutter_trial/router2/common/widget_common.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_common.g.dart';

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

/// Page1への遷移を実装する関数定義
typedef Page1Callback = void Function(BuildContext context);

/// Page3への遷移を実装する関数定義
typedef Page3Callback = void Function(BuildContext context, int index);

/// Page1への遷移を実装する関数を指定するProvider
@Riverpod(keepAlive: true)
Page1Callback page1RouteCallback(Page1RouteCallbackRef ref) =>
    throw UnimplementedError();

/// Page3への遷移を実装する関数を指定するProvider
@Riverpod(keepAlive: true)
Page3Callback page3RouteCallback(Page3RouteCallbackRef ref) =>
    throw UnimplementedError();
