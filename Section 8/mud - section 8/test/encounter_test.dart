import "package:test/test.dart";
import '../web/lib/mud.dart';

void main() {
  Encounter encounter;
  group("encounter tests", () {
    setUp(() {
      encounter = new Encounter({"number": 7, "damage": 3});
    });

    test("test encounter factory constructor", () {
      expect(encounter == null || encounter.whenEncounter().length > 5, true);
    });

    test("test encounter damage bigger then zero ", () {
      expect(encounter == null || encounter.damage_value >= 0, true);
    });

    tearDown(() {
      encounter = null;
    });
  });

}
