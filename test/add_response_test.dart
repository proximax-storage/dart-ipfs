import 'package:ipfs_sdk/src/add_response.dart';
import 'package:test/test.dart';

void main() {
  test('create', () {
    var addResponse = AddResponse(100, 'Qmvc', 'foo', '500');

    expect(addResponse.bytes, equals(100));
    expect(addResponse.hash, equals('Qmvc'));
    expect(addResponse.name, equals('foo'));
    expect(addResponse.size, equals('500'));
  });

  test('create from map', () {
    var json = {
      'Bytes': 200,
      'Hash': 'Qmdd',
      'Name': 'Name',
      'Size': '200'
    };
    var addResponse = AddResponse.fromJson(json);

    expect(addResponse.bytes, equals(200));
    expect(addResponse.hash, equals('Qmdd'));
    expect(addResponse.name, equals('Name'));
    expect(addResponse.size, equals('200'));
  });
}
