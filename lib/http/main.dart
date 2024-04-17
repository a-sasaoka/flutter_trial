// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trial/environment/flavor_provider.dart';
import 'package:flutter_trial/http/http.dart';
import 'package:http/http.dart' as http;

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
  final _client = MyHttpClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                final url =
                    Uri.https('jsonplaceholder.typicode.com', '/todos/1');
                final response = await http.get(url);
                log('statusCode = ${response.statusCode}');
                log('body = ${response.body}');
              },
              child: const Text('そのまま使う'),
            ),
            TextButton(
              onPressed: () async {
                final url =
                    Uri.https('jsonplaceholder.typicode.com', '/todos/1');
                final response = await _client.get(url);
                log('statusCode = ${response.statusCode}');
                log('body = ${response.body}');
              },
              child: const Text('カスタマイズして使う'),
            ),
          ],
        ),
      ),
    );
  }
}
