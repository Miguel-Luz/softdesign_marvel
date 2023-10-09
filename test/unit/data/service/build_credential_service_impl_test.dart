import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:softdesign_marvel/src/data/service/build_credential_service_impl.dart';

void main() {
  final buildCredentialService = BuildCredentialServiceImpl();

  test(
      'Devera retornar o hash correspondete ao experado dado o valores de entrada',
      () async {
    buildCredentialService.timestamp = '1';
    buildCredentialService.publicKey = '1234';
    buildCredentialService.privateKey = 'abcd';

    buildCredentialService.buildHash();

    final value =
        md5.convert(utf8.encode('${buildCredentialService.timestamp}abcd1234')).toString();

    expect(buildCredentialService.hash, value);
  });
}
