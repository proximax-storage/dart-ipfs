import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ipfs_sdk/client.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  IpfsClient unitUnderTest;
  http.Client client;

  setUp(() async {
    client = MockClient();
    unitUnderTest = IpfsClient('http://localhost:5001', client);
  });

  test('addString', () async {
    var apiResJson = '{"Bytes": 64, "Hash": "Qmabc", "Name":"Foo", "Size": "100"}';
    var apiRes = http.ByteStream.fromBytes(utf8.encode(apiResJson));
    when(client.send(any))
        .thenAnswer((_) async => http.StreamedResponse(apiRes, 200));
    
    var res = await unitUnderTest.addString('The quick brown fox jumps over the lazy dog');

    expect(res.bytes, equals(64));
    expect(res.hash, equals('Qmabc'));
    expect(res.name, equals('Foo'));
    expect(res.size, equals('100'));

    // verify argument captured
    var apiReq = verify(client.send(captureAny)).captured.single as http.MultipartRequest;
    expect(apiReq.url.toString(), equals('http://localhost:5001/api/v0/add'));
    expect(apiReq.method, equals('POST'));
  });

  test('catString', () async {
    var apiResJson = 'Got it, nice work!';
    var apiRes = http.ByteStream.fromBytes(utf8.encode(apiResJson));
    when(client.send(any))
        .thenAnswer((_) async => http.StreamedResponse(apiRes, 200));

    var res = await unitUnderTest.catString('Qmabc');

    expect(res, equals(apiResJson));

    // verify argument captured
    var apiReq = verify(client.send(captureAny)).captured.single as http.Request;
    expect(apiReq.url.toString(), equals('http://localhost:5001/api/v0/cat?arg=Qmabc'));
    expect(apiReq.method, equals('GET'));
  });

  test('cat', () async {
    var apiResJson = 'Got it, nice work!';
    var apiRes = http.ByteStream.fromBytes(utf8.encode(apiResJson));
    when(client.send(any))
        .thenAnswer((_) async => http.StreamedResponse(apiRes, 200));

    var res = await unitUnderTest.cat('Qmabc');
    var resJson = await utf8.decodeStream(res);

    expect(resJson, equals(apiResJson));

    // verify argument captured
    var apiReq = verify(client.send(captureAny)).captured.single as http.Request;
    expect(apiReq.url.toString(), equals('http://localhost:5001/api/v0/cat?arg=Qmabc'));
    expect(apiReq.method, equals('GET'));
  });
}
