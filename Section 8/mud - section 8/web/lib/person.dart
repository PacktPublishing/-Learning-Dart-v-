part of mud;

class Person {

  int x;
  int y;
  int health;
  int damage;

  final String key = "person_state";

  Person(this.x, this.y, this.health, this.damage) {
    var values = window.localStorage;
    if (values[key] != null) {
      load(values[key]);
    }
  }

  void load(props) {
    var retrieve = props is String ? JSON.decode(props) : props;

    this.x = retrieve['x'];
    this.y = retrieve['y'];
    this.health = retrieve['health'];
    this.damage = retrieve['damage'];
  }

  Map toJson() {
    Map map = new Map();
    map["x"] = this.x;
    map["y"] = this.y;
    map["health"] = this.health;
    map["damage"] = this.damage;
    return map;
  }

  save() {
    var values = window.localStorage;
    if (values != null) {
      values[key] = JSON.encode(this.toJson());
    }
  }

}
