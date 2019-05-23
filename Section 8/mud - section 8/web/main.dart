// Copyright (c) 2015, Joris Hermans. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'lib/angular/display_component.dart';
import 'lib/angular/data_service.dart';

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';

void main() {
  // angular bootstrap
  bootstrap(DisplayComponent, [DataService]);
}
