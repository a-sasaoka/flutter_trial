// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trial/environment/flavor_provider.dart';
import 'package:flutter_trial/save_json/data.dart';
import 'package:flutter_trial/save_json/directory_provider.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = Flavor.values.byName(const String.fromEnvironment('flavor'));
  final directory = await getApplicationCacheDirectory();

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        cacheDirectoryProvider.overrideWithValue(directory),
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

    final employeeList = [
      const Employee(name: '山田', age: 20),
      const Employee(name: '佐藤', age: 30),
    ];
    final company =
        Company(name: 'テスト企業', address: '東京都', person: employeeList);
    final jsonString = json.encode(company.toJson());

    final directory = ref.read(cacheDirectoryProvider);
    final path = '${directory.path}/test.json';
    File(path).writeAsStringSync(jsonString);
    log('save:$jsonString');
  }

  @override
  Widget build(BuildContext context) {
    final directory = ref.read(cacheDirectoryProvider);
    final path = '${directory.path}/test.json';
    final jsonString = File(path).readAsStringSync();
    log('load:$jsonString');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
