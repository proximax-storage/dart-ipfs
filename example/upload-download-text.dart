/**
 *** Copyright 2019 ProximaX Limited. All rights reserved.
 *** Use of this source code is governed by the Apache 2.0
 *** license that can be found in the LICENSE file.
 * */

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
