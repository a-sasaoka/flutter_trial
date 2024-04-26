// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trial/router2/common/router_common.dart';
import 'package:go_router/go_router.dart';

class Page2 extends ConsumerStatefulWidget {
  const Page2({super.key});

  @override
  ConsumerState<Page2> createState() => _Page2State();
}

class _Page2State extends ConsumerState<Page2> {
  @override
  Widget build(BuildContext context) {
    final page1Callback = ref.read(page1RouteCallbackProvider);
    final page3Callback = ref.read(page3RouteCallbackProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('page2'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Column(
          children: [
            TextButton(
              // onPressed: () => context.goNamed('page1'),
              onPressed: () => page1Callback(context),
              child: const Text('Page1へ遷移(go)'),
            ),
            TextButton(
              // onPressed: () =>
              //     context.goNamed('page3', pathParameters: {'index': '200'}),
              onPressed: () => page3Callback(context, 200),
              child: const Text('Page3へ遷移(go)'),
            ),
            TextButton(
              onPressed: () => context.pushNamed('page1'),
              child: const Text('Page1へ遷移(push)'),
            ),
            TextButton(
              onPressed: () =>
                  context.pushNamed('page3', pathParameters: {'index': '100'}),
              child: const Text('Page3へ遷移(push)'),
            ),
          ],
        ),
      ),
    );
  }
}
