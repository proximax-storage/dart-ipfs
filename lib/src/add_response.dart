/**
 *** Copyright 2019 ProximaX Limited. All rights reserved.
 *** Use of this source code is governed by the Apache 2.0
 *** license that can be found in the LICENSE file.
 * */

class AddResponse {
  final int bytes;
  final String hash;
  final String name;
  final String size;

  AddResponse(this.bytes, this.hash, this.name, this.size);

  AddResponse.fromJson(Map<String, dynamic> json)
      : bytes = json['Bytes'],
        hash = json['Hash'],
        name = json['Name'],
        size = json['Size'];
}