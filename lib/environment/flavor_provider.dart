import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor_provider.g.dart';

/// Flavorを扱うProvider
@Riverpod(keepAlive: true)
Flavor flavor(FlavorRef ref) {
  throw UnimplementedError();
}

/// Flavorの定義
enum Flavor {
  /// 開発環境
  dev,

  /// ステージング環境
  stg,

  /// 本番環境
  prod,
}
