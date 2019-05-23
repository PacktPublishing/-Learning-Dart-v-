import 'package:test/test.dart';
import 'dart:html';

main() {
  test("queryselector the value", () {
    var textEl = querySelector("#text");
    expect(textEl.innerHtml, "awesome");
  });
}
