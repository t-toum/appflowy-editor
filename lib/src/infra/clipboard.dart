import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
// import 'package:super_clipboard/super_clipboard.dart';

class AppFlowyClipboardData {
  const AppFlowyClipboardData({
    this.text,
    this.html,
  });
  final String? text;
  final String? html;
}

class AppFlowyClipboard {
  // static AppFlowyClipboardData? _mockData;

  static Future<void> setData({
    String? text,
    String? html,
  }) async {
    // https://github.com/BringingFire/rich_clipboard/issues/13
    // Wrapping a `<html><body>` tag for html in Windows,
    //  otherwise it will raise an exception
    if (!kIsWeb && Platform.isWindows && html != null) {
      if (!html.startsWith('<html><body>')) {
        html = '<html><body>$html</body></html>';
      }
    }
    // final clipboard = SystemClipboard.instance;
    // if(clipboard == null){
    //   throw UnimplementedError();
    // }
    // final item = DataWriterItem();
    // item.add(Formats.plainText(text ?? ''));
    // item.add(Formats.htmlText(html ?? ""));
    // return await clipboard.write([item]);
  }

  static Future<AppFlowyClipboardData> getData() async {
    // final clipboard = SystemClipboard.instance;
    // if(clipboard == null) {
    //   throw UnimplementedError();
    // }
    // if (_mockData != null) {
    //   return _mockData!;
    // }
    // final reader = await clipboard.read();
    // final text = await reader.readValue(Formats.plainText);
    // var html = await reader.readValue(Formats.htmlText);

    // https://github.com/BringingFire/rich_clipboard/issues/13
    // Remove all the fragment symbol in Windows.
    // if (!kIsWeb && Platform.isWindows && html != null) {
    //   html = html
    //       .replaceAll('<!--StartFragment-->', '')
    //       .replaceAll('<!--EndFragment-->', '');
    // }

    return const AppFlowyClipboardData(
      text: "",
      html: "",
    );
  }

  @visibleForTesting
  static void mockSetData(AppFlowyClipboardData? data) {
    // _mockData = data;
  }
}
