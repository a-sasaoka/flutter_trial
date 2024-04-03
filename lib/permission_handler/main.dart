// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trial/environment/flavor_provider.dart';
import 'package:flutter_trial/util/providers/permission_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final permission = ref.watch(permissionCameraProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: permission.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Column(
              children: [
                Text('$data'),
                TextButton(
                  onPressed: () {
                    ref.read(permissionCameraProvider.notifier).request();
                  },
                  child: const Text('権限を要求'),
                ),
                const TextButton(
                  onPressed: openAppSettings,
                  child: Text('OSの設定画面表示'),
                ),
              ],
            ),
          );
        },
        error: (error, stack) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
