part of mud;

class Environment {

  String _name;

  Encounter encounter;

  Environment(name) {
    this.name = name;
    this.encounter = new Bear();
  }

  String stumbleUpon() {
    var done_damage = damage;
    var interaction = "${_name} You just stumbled upon ... ${this.encounter.whenEncounter()}";
    if (done_damage > 0) {
     interaction += "<br /> You have ${done_damage} damage!";
   }
   return interaction;
  }

  get damage => encounter.damage_value;

  set name(name) {
    this._name = "[${name}]";
  }

  get name => this._name;

}
