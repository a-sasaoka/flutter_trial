// ignore_for_file: public_member_api_docs

import 'package:http/http.dart' as http;

class MyHttpClient extends http.BaseClient {
  // ここでは使用する Client を固定しているが、コンストラクタで動的に渡せるようにしてもよい
  final _inner = http.Client();

  // ヘッダーに設定する内容をコンストラクタで渡すようにしたり、setter で設定したりしてもよい

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // 例えばUserAgentを設定する
    request.headers['user-agent'] =
        'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) CriOS/31.0.1650.18 Mobile/11B554a Safari/8536.25';
    return _inner.send(request);
  }
}
