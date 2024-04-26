// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $page1Route,
    ];

RouteBase get $page1Route => GoRouteData.$route(
      path: '/',
      name: 'page1',
      factory: $Page1RouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'page3/:index',
          name: 'page3',
          factory: $Page3RouteExtension._fromState,
        ),
      ],
    );

extension $Page1RouteExtension on Page1Route {
  static Page1Route _fromState(GoRouterState state) => Page1Route();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $Page3RouteExtension on Page3Route {
  static Page3Route _fromState(GoRouterState state) => Page3Route(
        index: int.parse(state.pathParameters['index']!),
      );

  String get location => GoRouteData.$location(
        '/page3/${Uri.encodeComponent(index.toString())}',
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

String _$routerHash() => r'db53bd09b3b67202022e66a1901d613c25892a20';

/// Routerを管理するProvider
///
/// Copied from [router].
@ProviderFor(router)
final routerProvider = Provider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
