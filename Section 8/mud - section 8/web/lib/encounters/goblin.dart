part of mud;

class Goblin extends Encounter {

  int damage_value = 0;

  Goblin(this.damage_value) : super._();

  whenEncounter() {
    return "A small tiny green creator is coming your way, it appears to be a goblin ...";
  }

}
