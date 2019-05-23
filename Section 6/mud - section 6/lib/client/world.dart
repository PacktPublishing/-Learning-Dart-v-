// This is a generated file (see the discoveryapis_generator project).

library SomeApp.world.client;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;
import 'package:SomeApp/server.dart';
export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client world/v1';

class World {

  final commons.ApiRequester _requester;

  World(http.Client client, {core.String rootUrl: "http://localhost:8080/", core.String servicePath: "world/v1/"}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);

  /**
   * Request parameters:
   *
   * [x] - Path parameter: 'x'.
   *
   * [y] - Path parameter: 'y'.
   *
   * Completes with a [Terrain].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Terrain> getWorldInfo(core.String x, core.String y) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (x == null) {
      throw new core.ArgumentError("Parameter x is required.");
    }
    if (y == null) {
      throw new core.ArgumentError("Parameter y is required.");
    }

    _url = 'info/' + commons.Escaper.ecapeVariable('$x') + '/' + commons.Escaper.ecapeVariable('$y');

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => TerrainFactory.fromJson(data));
  }

}



class TerrainFactory {
  static Terrain fromJson(core.Map _json) {
    var message = new Terrain();
    if (_json.containsKey("name")) {
      message.name = _json["name"];
    }
    if (_json.containsKey("x")) {
      message.x = _json["x"];
    }
    if (_json.containsKey("y")) {
      message.y = _json["y"];
    }
    return message;
  }

  static core.Map toJson(Terrain message) {
    var _json = new core.Map();
    if (message.name != null) {
      _json["name"] = message.name;
    }
    if (message.x != null) {
      _json["x"] = message.x;
    }
    if (message.y != null) {
      _json["y"] = message.y;
    }
    return _json;
  }
}

