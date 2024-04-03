import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_provider.g.dart';

/// カメラの権限を管理するProvider
@Riverpod(keepAlive: true)
class PermissionCamera extends _$PermissionCamera {
  @override
  Future<PermissionStatus> build() async {
    /// 最初に現在の権限を取得
    return Permission.camera.status;
  }

  /// 権限が無い場合は権限を要求
  Future<void> request() async {
    // stateをローディングに変更
    state = const AsyncValue.loading();
    // 変更した状態をstateに設定
    state = await AsyncValue.guard(() async {
      var status = await Permission.camera.status;
      log(status.toString());
      if (status == PermissionStatus.granted) {
        return status;
      }
      status = await Permission.camera.request();
      log(status.toString());
      return status;
    });
  }
}
