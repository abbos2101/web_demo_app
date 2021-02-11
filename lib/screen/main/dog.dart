import 'dart:js' as js;

class MyJS {
  static void ShowDialog(String text) =>
      js.context.callMethod("alertMessage", ["$text"]);

  static void print(dynamic text) =>
      js.context.callMethod("consoleMessage", [text]);
}
