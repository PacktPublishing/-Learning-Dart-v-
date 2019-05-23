import 'package:mongo_dart/mongo_dart.dart';
import 'dart:math';

main() async {
  print("go for it ...");
  Db db = new Db("mongodb://127.0.0.1:27017/test");
  await db.open();
  await db.drop();
  print("database is open");
  var collection = db.collection('world');
  var userCollection = db.collection('users');

  // to create a field of grass 100x100
  List playGround = new List();
  var _rng = new Random();

  for (var x=0; x<10;x++) {
    for (var y=0; y<10;y++) {

      var value = _rng.nextInt(5);
      if (value==3) {
          playGround.add({'x': x, 'y': y, 'terrain': 'tree'});
      } else {
          playGround.add({'x': x, 'y': y, 'terrain': 'grass'});
      }
      print("coordinate ${x} ${y}");
    }
  }
  print("put them into a collection");
  await collection.insertAll(playGround);
  await userCollection.insertAll([
    {
      'name': 'William Shakespeare',
      'email': 'william@shakespeare.com',
      'age': 587
    },
    {'name': 'Jorge Luis Borges', 'email': 'jorge@borges.com', 'age': 123}
  ]);
  print("done!");

  await db.close();
}
