// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class BuildCredentialService {
  late String publicKey;
  late String privateKey;
  late String timestamp;
  late String hash;

  String buildHash();
}
