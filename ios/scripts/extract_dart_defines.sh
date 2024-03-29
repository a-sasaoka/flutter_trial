#!/bin/sh

# Dart define を書き出すファイルパスを指定
# ここでは `Dart-Defines.xcconfig` というファイル名で作成することにする
OUTPUT_FILE="${SRCROOT}/Flutter/Dart-Defines.xcconfig"
# Dart define の中身を変更した時に古いプロパティが残らないように、初めにファイルを空にする
: > $OUTPUT_FILE

# この関数で Dart define をデコードする
function decode_url() { echo "${*}" | base64 --decode; }

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for index in "${!define_items[@]}"
do
    item=$(decode_url "${define_items[$index]}")
    # Dart の定義には Flutter 側で自動定義された項目も含まれる
    # しかし、それらの定義を書き出してしまうとエラーによりビルドができなくなるので、
    # `flutter` や `FLUTTER` で始まる項目は出力しないようにする
    lowercase_item=$(echo "$item" | tr '[:upper:]' '[:lower:]')
    if [[ $lowercase_item != flutter* ]]; then
        echo "$item" >> "$OUTPUT_FILE"
    fi
done