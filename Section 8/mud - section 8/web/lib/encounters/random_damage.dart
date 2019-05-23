part of mud;

class RandomDamage {

  var _rng = new Random();
  get damage_value => _rng.nextInt(5);

}
