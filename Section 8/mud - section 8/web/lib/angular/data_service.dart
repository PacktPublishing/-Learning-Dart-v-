library angular.services;

import 'package:angular2/angular2.dart';
import 'dart:async';

@Injectable()
class DataService {

  getName(person) {
    return new Future.value("wastelands");
  }
}
