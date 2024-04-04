import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uni_links/uni_links.dart';

part 'deep_link_provider.g.dart';

/// ディープリンクから遷移した際に指定されたコールバックを呼び出すProvider
@Riverpod(keepAlive: true)
void deepLink(DeepLinkRef ref, {required ValueChanged<Uri?> callback}) {
  final sub = uriLinkStream.listen(callback);

  ref.onDispose(sub.cancel);
}

/// ディープリンクで取得したURIを管理するProvider
final deepLinkUriProvider = StateProvider<Uri?>((ref) => null);
