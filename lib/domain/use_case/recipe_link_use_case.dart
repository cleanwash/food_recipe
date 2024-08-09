import 'package:flutter/services.dart';

class CopyLinkUseCase {
  Future<void> execute(String link) async {
    await Clipboard.setData(ClipboardData(text: link));
  }
}