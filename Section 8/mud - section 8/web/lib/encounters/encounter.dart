part of mud;

abstract class Encounter {

  int damage_value = 0;

  Encounter._();

  factory Encounter(Map options) {
    options ??= new Map();
    var number = options["number"] ?? 1;
    var damage_value = options["damage"] ?? 1;

    var _rng = new Random();
    var value = _rng.nextInt(number);

    switch (value) {
    case 1:
        return new Nothing();
    case 2:
      return new Bear();
    case 3:
      return new Angel();
    case 4:
      return new DrunkenSailer();
    case 5:
      return new Ghost();
    case 6:
        return new Goblin(damage_value);
    default:
      return new Nothing();
    }
  }

  whenEncounter();

}
