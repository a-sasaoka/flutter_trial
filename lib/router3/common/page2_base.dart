import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Page2の基本動作を定義するクラス
abstract class Page2Base extends ConsumerStatefulWidget {
  /// コンストラクタ
  const Page2Base({super.key});

  /// Page1へ遷移（go）
  ///
  /// 継承したクラスで実装する
  void page1RouteGo(BuildContext context);

  /// Page1へ遷移（push）
  ///
  /// 継承したクラスで実装する
  void page1RoutePush(BuildContext context);

  /// Page3へ遷移（go）
  ///
  /// 継承したクラスで実装する
  void page3RouteGo(BuildContext context, int index);

  /// Page3へ遷移（push）
  ///
  /// 継承したクラスで実装する
  void page3RoutePush(BuildContext context, int index);

  @override
  ConsumerState<Page2Base> createState() => _Page2State();
}

class _Page2State extends ConsumerState<Page2Base> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () => widget.page1RouteGo(context),
              child: const Text('Page1へ遷移(go)'),
            ),
            TextButton(
              onPressed: () => widget.page3RouteGo(context, 200),
              child: const Text('Page3へ遷移(go)'),
            ),
            TextButton(
              onPressed: () => widget.page1RoutePush(context),
              child: const Text('Page1へ遷移(push)'),
            ),
            TextButton(
              onPressed: () => widget.page3RoutePush(context, 100),
              child: const Text('Page3へ遷移(push)'),
            ),
          ],
        ),
      ),
    );
  }
}
