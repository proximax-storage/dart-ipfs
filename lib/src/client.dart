/**
 *** Copyright 2019 ProximaX Limited. All rights reserved.
 *** Use of this source code is governed by the Apache 2.0
 *** license that can be found in the LICENSE file.
 * */

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;
import 'package:ipfs_sdk/src/add_response.dart';

class IpfsClient {
  final http.Client _client;
  final String _baseApiUri;

  IpfsClient(this._baseApiUri, this._client);

  IpfsClient.fromUri(this._baseApiUri) : _client = http.IOClient();

  Future<StreamView<List<int>>> cat(String arg) async {
    var response = await _get('/api/v0/cat?arg=$arg');
    return response.stream;
  }

  Future<String> catString(String arg) async {
    var response = await _get('/api/v0/cat?arg=$arg');
    return await utf8.decodeStream(response.stream);
  }

  Future<AddResponse> addString(String content) async {
    var part = http.MultipartFile.fromString('file', content);
    var res = await _multipart('/api/v0/add', [part]);
    var body = await utf8.decodeStream(res.stream);
    return AddResponse.fromJson(jsonDecode(body));
  }

  Future<http.StreamedResponse> _get(String path) async {
    var uri = Uri.parse('$_baseApiUri$path');
    var req = http.Request('GET', uri);
    return _client.send(req);
  }

  Future<http.StreamedResponse> _multipart(
      String path, Iterable<http.MultipartFile> parts) async {
    var uri = Uri.parse('$_baseApiUri$path');
    var req = http.MultipartRequest('POST', uri)..files.addAll(parts);
    return _client.send(req);
  }
}
