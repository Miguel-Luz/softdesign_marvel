import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:softdesign_marvel/src/domain/services/build_credential_service.dart';

class BuildCredentialServiceImpl implements BuildCredentialService {
  @override
  late String timestamp;

  @override
  late String hash;

  @override
  String privateKey = '797d7a1eb2547f284dc6d649830bad8590245ab4';

  @override
  String publicKey = 'd11f2a451e9619921fdf311476c4ef64';

  @override
  String buildHash() {
    timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    hash =
        md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString();

    return hash;
  }
}
