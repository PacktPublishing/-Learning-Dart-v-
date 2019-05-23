part of mud;

class Bear extends Encounter with RandomDamage {

  Bear() : super._();

  var audio = new AudioElement('/sound/bearsound.wav');

  whenEncounter() {
    audio.play();
    return "grr grow, you encountered a bear!";
  }

}
