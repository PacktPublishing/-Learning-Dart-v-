library angular.display;

import 'package:angular2/angular2.dart';
import 'dart:html';
import 'dart:convert';
import '../mud.dart';
import 'data_service.dart';

@Component(selector: 'display', providers: const [DataService])
@View(template: '''
<div id="coordinates">Place : {{person.x}}, {{person.y}} ({{name}}) </div> (<a id="download" download="save.txt" href="{{blob}}">download save file</a>)
<div id="output">
  <div *ngFor="#output of outputs">
        {{ output }}
  </div>
</div>

<input type="text" #command />
<input id="enter" type="submit" value="Submit" (click)="addCommand(command.value)" />
''', directives: const [NgFor])
@Injectable()
class DisplayComponent {
  Person person = new Person(0, 0, 200, 5);
  List outputs = new List();

  Environment myEnvironment = new Environment("Wood");
  String blob = "";

  DataService dataService;
  String name;

  DisplayComponent(this.dataService);

  void addCommand(value) {
    String output = "";
    switch (value) {
    case 'left':
      updateCoordinates(-1, 0);
      output = "You are going left now.";
      break;
    case 'right':
      updateCoordinates(1, 0);
      output = "You are going right, are you sure?";
      break;
    case 'up':
      updateCoordinates(0, -1);
      output = "You are going up, are you sure?";
      break;
    case 'down':
      updateCoordinates(0, 1);
      output = "You are going down, are you sure?";
      break;
    default:
      output = "Use left, right, up, down please ...";
    }

    outputs.add(output);
    outputs.add(myEnvironment.stumbleUpon(person));

    // save the persons stats
    person.save();

    blob = makeTextFile(JSON.encode(person.toJson()));
  }

  void updateCoordinates(int rel_x, int rel_y) {
       person.x += rel_x;
       person.y += rel_y;

       dataService.getName(person).then((value) {
          name = value;
       });
  }

  var textFile;
  String makeTextFile(text) {
      var data = new Blob([text]);

      if (textFile != null) {
          Url.revokeObjectUrl(textFile);
      }
      textFile = Url.createObjectUrl(data);

      return textFile;
  }
}
