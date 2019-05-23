part of mud;

class Bear extends Encounter {

  var _rng = new Random();
  get damage_value => _rng.nextInt(5);

  whenEncounter() {
    return "grr grow, you encountered a bear!";
  }

}
