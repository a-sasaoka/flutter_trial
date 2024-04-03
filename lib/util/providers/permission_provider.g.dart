// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$permissionCameraHash() => r'5c1f61cd4c404f60e970fe37c7a29a96dfebe0f4';

/// カメラの権限を管理するProvider
///
/// Copied from [PermissionCamera].
@ProviderFor(PermissionCamera)
final permissionCameraProvider =
    AsyncNotifierProvider<PermissionCamera, PermissionStatus>.internal(
  PermissionCamera.new,
  name: r'permissionCameraProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$permissionCameraHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PermissionCamera = AsyncNotifier<PermissionStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
