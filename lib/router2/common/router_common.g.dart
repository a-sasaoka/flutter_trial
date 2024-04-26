// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_common.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $page2Route,
    ];

RouteBase get $page2Route => GoRouteData.$route(
      path: '/page2',
      factory: $Page2RouteExtension._fromState,
    );

extension $Page2RouteExtension on Page2Route {
  static Page2Route _fromState(GoRouterState state) => Page2Route();

  String get location => GoRouteData.$location(
        '/page2',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$page1RouteCallbackHash() =>
    r'3b8dbafd506be8956e39fbb382dc579cc0ad4d35';

/// Page1への遷移を実装する関数を指定するProvider
///
/// Copied from [page1RouteCallback].
@ProviderFor(page1RouteCallback)
final page1RouteCallbackProvider = Provider<Page1Callback>.internal(
  page1RouteCallback,
  name: r'page1RouteCallbackProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$page1RouteCallbackHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef Page1RouteCallbackRef = ProviderRef<Page1Callback>;
String _$page3RouteCallbackHash() =>
    r'4969409c2fa1a5026160125201f9d08593434f2f';

/// Page3への遷移を実装する関数を指定するProvider
///
/// Copied from [page3RouteCallback].
@ProviderFor(page3RouteCallback)
final page3RouteCallbackProvider = Provider<Page3Callback>.internal(
  page3RouteCallback,
  name: r'page3RouteCallbackProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$page3RouteCallbackHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef Page3RouteCallbackRef = ProviderRef<Page3Callback>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
