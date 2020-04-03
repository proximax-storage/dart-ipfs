<h1 align='center'>Dart IPFS SDK</h1>

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

The IPFS Dart SDK is the unofficial SDK for integrating with an IPFS instance.

**1. Depend on it**

Add this to your package's pubspec.yaml file:

```dart
dependencies:
  ipfs_sdk: 0.0.1
```

**2. Install it**

You can install packages from the command line:

with pub:

```dart
$ pub get
```

with Flutter:

```dart
$ flutter packages get
```

Alternatively, your editor might support pub get or flutter packages get. Check the docs for your editor to learn more.

**3. Import it**

Now in your Dart code, you can use:

```dart
import 'package:ipfs_sdk/client.dart';
```

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

## Wiki and Examples ##

Examples are in the [examples](https://github.com/proximax-storage/dart-ipfs/tree/master/example) folder

For more examples, go to our [wiki](https://github.com/proximax-storage/dart-xpx-chain-sdk/wiki)

## Contribution ##
Please feel free to raise any issues or PR and we'll review your contribution.
   
Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/proximax-storage/dart-ipfs/issues
