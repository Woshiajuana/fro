import 'package:bot_toast/bot_toast.dart';

class FroToast {
  FroToast._();

  static void showToast(String text) {
    BotToast.showText(text: text);
  }
}
