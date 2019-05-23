part of mud;

class Environment {

  String _name;

  Encounter encounter;

  Environment(name) {
    this.name = name;
    this.encounter = new Encounter({});
  }

  String stumbleUpon(Person person) {
    this.encounter = new Encounter({"number": 4, "damage": 3});

    var done_damage = this.encounter?.damage_value;
    var interaction = "${_name} You just stumbled upon ... ${this.encounter?.whenEncounter()}";
    if (done_damage != null && done_damage > 0) {
     person.health -= done_damage;
     interaction += "You have ${done_damage} damage! You have still ${person.health} left!";
   }
   return interaction;
  }

  get damage => encounter.damage_value;

  set name(name) {
    this._name = "[${name}]";
  }

  get name => this._name;

}
