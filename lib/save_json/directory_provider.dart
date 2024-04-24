import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'directory_provider.g.dart';

/// キャッシュディレクトリを扱うProvider
@Riverpod(keepAlive: true)
Directory cacheDirectory(CacheDirectoryRef ref) => throw UnimplementedError();
