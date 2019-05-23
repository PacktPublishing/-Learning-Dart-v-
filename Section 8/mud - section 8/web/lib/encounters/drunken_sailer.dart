part of mud;

class DrunkenSailer extends Encounter {

  DrunkenSailer() : super._();

  get damage_value => 0;

  whenEncounter() {
    return "'how how, dr ... whobli, ship a hoi' says a drunken sailer.";
  }

}
