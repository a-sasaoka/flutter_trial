// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trial/environment/flavor_provider.dart';
import 'package:flutter_trial/util/providers/deep_link_provider.dart';
import 'package:uni_links/uni_links.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = Flavor.values.byName(const String.fromEnvironment('flavor'));

  final uri = await getInitialUri();

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        deepLinkUriProvider.overrideWith((ref) => uri),
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
  void initState() {
    super.initState();
    ref.read(
      DeepLinkProvider(
        callback: (uri) => ref.read(deepLinkUriProvider.notifier).state = uri,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final uri = ref.watch(deepLinkUriProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: createBody(uri),
    );
  }

  Widget createBody(Uri? uri) {
    if (uri == null) {
      return const Center(
        child: Text('DeepLinkではないです！'),
      );
    } else {
      return Center(
        child: Text(uri.toString()),
      );
    }
  }
}
