import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_info.g.dart';

/// ログイン状態
@Riverpod(keepAlive: true)
class LoginInfo extends _$LoginInfo {
  @override
  bool build() {
    return true;
  }

  /// ログイン
  void login() {
    state = true;
  }

  /// ログアウト
  void logout() {
    state = false;
  }
}
