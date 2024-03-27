// ignore_for_file: public_member_api_docs

import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trial/firebase_options.dart';

Future<void> main() async {
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Flutter内で発生したエラーを処理する
  FlutterError.onError = (details) async {
    // レポート送信後にアプリを終了
    await FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    log('送信完了');
    exit(1);
  };

  // 非同期処理内で発生したエラーを処理する
  widgetBinding.platformDispatcher.onError = (exception, stackTrace) {
    FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    log('送信完了');
    return true;
  };

  runApp(const MyApp());
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => throw Exception(),
              child: const Text('Throw Test Exception'),
            ),
            TextButton(
              onPressed: () => FirebaseCrashlytics.instance.crash(),
              child: const Text('Force crash'),
            ),
          ],
        ),
      ),
    );
  }
}
