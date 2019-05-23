import 'dart:io';
import 'dart:async';
import 'package:rpc/rpc.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http_server/http_server.dart';

final ApiServer _apiServer = new ApiServer();

final String _buildPath =
    Platform.script.resolve('../build/web/').toFilePath();
final VirtualDirectory _clientDir =
    new VirtualDirectory(_buildPath);

main() async {
  Db db = new Db("mongodb://127.0.0.1:27017/test");
  await db.open();
  var collection = db.collection('world');

  _apiServer.addApi(new World(collection));
  print('starting server on 8083');
  HttpServer server = await HttpServer.bind('127.0.0.1', 8083);
  server.listen(requestHandler);
}

Future requestHandler(HttpRequest request) async {
  print("some handling in request handler ...");
  if (request.uri.path.startsWith('/world')) {
    // Handle the API request.
    print("world api? ...");
    var apiResponse;
    try {
      var apiRequest = new HttpApiRequest.fromHttpRequest(request);
      apiResponse =
          await _apiServer.handleHttpApiRequest(apiRequest);
    } catch (error, stack) {
      var exception =
          error is Error ? new Exception(error.toString()) : error;
      apiResponse = new HttpApiResponse.error(
          HttpStatus.INTERNAL_SERVER_ERROR, exception.toString(),
          exception, stack);
    }
    return sendApiResponse(apiResponse, request.response);
  } else if (request.uri.path == '/') {
    // Redirect to the piratebadge.html file. This will initiate
    // loading the client application.
    request.response.redirect(Uri.parse('/index.html'));
  } else {
    // Serve the requested file (path) from the virtual directory,
    // minus the preceeding '/'. This will fail with a 404 Not Found
    // if the request is not for a valid file.
    var fileUri = new Uri.file(_buildPath)
        .resolve(request.uri.path.substring(1));
    _clientDir.serveFile(new File(fileUri.toFilePath()), request);
  }
}

@ApiClass(version: 'v1')
class World {
  DbCollection collection;

  World([this.collection]);

  @ApiMethod(method: 'GET', path: 'info/{x}/{y}')
  Future<Terrain> getWorldInfo(String x, String y) async {
    var json, val = await this.collection.findOne(where.eq("x", int.parse(x)).and(where.eq("y", int.parse(y))));

    json = new Terrain()
            ..name = (val== null ? 'wasteland' : val['terrain'])
            ..x = (val == null ? x : val['x'])
            ..y = (val == null ? y : val['y']);

    return json;
  }
}

class Terrain {
  String name;
  String x;
  String y;
}
