part of mud;

class Vampire extends Encounter with RandomDamage, SaySomething {

  Vampire() : super._();

  whenEncounter() {
    return "A vampire is flying by! ${sentence()}";
  }

}
