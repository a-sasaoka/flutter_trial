// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deepLinkHash() => r'7c3d670280caabdecec2f4bd0e5b17d1b8075c04';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// ディープリンクから遷移した際に指定されたコールバックを呼び出すProvider
///
/// Copied from [deepLink].
@ProviderFor(deepLink)
const deepLinkProvider = DeepLinkFamily();

/// ディープリンクから遷移した際に指定されたコールバックを呼び出すProvider
///
/// Copied from [deepLink].
class DeepLinkFamily extends Family<void> {
  /// ディープリンクから遷移した際に指定されたコールバックを呼び出すProvider
  ///
  /// Copied from [deepLink].
  const DeepLinkFamily();

  /// ディープリンクから遷移した際に指定されたコールバックを呼び出すProvider
  ///
  /// Copied from [deepLink].
  DeepLinkProvider call({
    required void Function(Uri?) callback,
  }) {
    return DeepLinkProvider(
      callback: callback,
    );
  }

  @override
  DeepLinkProvider getProviderOverride(
    covariant DeepLinkProvider provider,
  ) {
    return call(
      callback: provider.callback,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deepLinkProvider';
}

/// ディープリンクから遷移した際に指定されたコールバックを呼び出すProvider
///
/// Copied from [deepLink].
class DeepLinkProvider extends Provider<void> {
  /// ディープリンクから遷移した際に指定されたコールバックを呼び出すProvider
  ///
  /// Copied from [deepLink].
  DeepLinkProvider({
    required void Function(Uri?) callback,
  }) : this._internal(
          (ref) => deepLink(
            ref as DeepLinkRef,
            callback: callback,
          ),
          from: deepLinkProvider,
          name: r'deepLinkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deepLinkHash,
          dependencies: DeepLinkFamily._dependencies,
          allTransitiveDependencies: DeepLinkFamily._allTransitiveDependencies,
          callback: callback,
        );

  DeepLinkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.callback,
  }) : super.internal();

  final void Function(Uri?) callback;

  @override
  Override overrideWith(
    void Function(DeepLinkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeepLinkProvider._internal(
        (ref) => create(ref as DeepLinkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        callback: callback,
      ),
    );
  }

  @override
  ProviderElement<void> createElement() {
    return _DeepLinkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeepLinkProvider && other.callback == callback;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, callback.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeepLinkRef on ProviderRef<void> {
  /// The parameter `callback` of this provider.
  void Function(Uri?) get callback;
}

class _DeepLinkProviderElement extends ProviderElement<void> with DeepLinkRef {
  _DeepLinkProviderElement(super.provider);

  @override
  void Function(Uri?) get callback => (origin as DeepLinkProvider).callback;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
