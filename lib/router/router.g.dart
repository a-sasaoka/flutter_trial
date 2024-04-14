// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $page1Route,
      $page2Route,
    ];

RouteBase get $page1Route => GoRouteData.$route(
      path: '/',
      factory: $Page1RouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'page3/:index',
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

String _$routerHash() => r'2dfec0b394101653fec354f3405e04c1f2d044dd';

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
