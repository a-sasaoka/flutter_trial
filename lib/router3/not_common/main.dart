// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trial/environment/flavor_provider.dart';
import 'package:flutter_trial/router3/common/page2_base.dart';
import 'package:flutter_trial/router3/not_common/router.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = Flavor.values.byName(const String.fromEnvironment('flavor'));

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class Page1 extends ConsumerStatefulWidget {
  const Page1({super.key});

  @override
  ConsumerState<Page1> createState() => _Page1State();
}

class _Page1State extends ConsumerState<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('page1'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Column(
          children: [
            TextButton(
              onPressed: () => Page2Route().go(context),
              child: const Text('Page2へ遷移(go)'),
            ),
            TextButton(
              onPressed: () => const Page3Route(index: 100).go(context),
              child: const Text('Page3へ遷移(go)'),
            ),
            TextButton(
              onPressed: () => Page2Route().push<void>(context),
              child: const Text('Page2へ遷移(psuh)'),
            ),
            TextButton(
              onPressed: () => const Page3Route(index: 100).push<void>(context),
              child: const Text('Page3へ遷移(push)'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends Page2Base {
  const Page2({super.key});

  @override
  void page1RouteGo(BuildContext context) {
    Page1Route().go(context);
  }

  @override
  void page1RoutePush(BuildContext context) {
    Page1Route().push<void>(context);
  }

  @override
  void page3RouteGo(BuildContext context, int index) {
    Page3Route(index: index).go(context);
  }

  @override
  void page3RoutePush(BuildContext context, int index) {
    Page3Route(index: index).push<void>(context);
  }
}

class Page3 extends ConsumerStatefulWidget {
  const Page3({required this.index, super.key});

  final int index;

  @override
  ConsumerState<Page3> createState() => _Page3State();
}

class _Page3State extends ConsumerState<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('page3'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Column(
          children: [
            Text('${widget.index}'),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
