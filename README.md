A library for Dart developers.

## Usage

A simple usage example:

```dart
import 'dart:io';

import 'package:ipfs_sdk/client.dart';

void main() async {
  const uri = 'http://localhost:5001';
  const text = 'ProximaX is a next-generation blockchain protocol.';
  var client = IpfsClient.fromUri(uri);

  // upload
  var resp = await client.addString(text);
  print('uploaded content with hash ${resp.hash}');

  // download
  var downloaded = await client.catString(resp.hash);
  print('downloaded content is "$downloaded".');

  exit(0);
}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/proximax-storage/dart-ipfs/issues
