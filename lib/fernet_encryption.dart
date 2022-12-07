import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class FernetEcryption {
  //for Fernet Algorithms
  static Encrypted? fernetEncrypted;
  static var fernetDecrypted;

  static encryptFernet(plainText) {
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final iv = IV.fromLength(16);

    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);
    fernetEncrypted = encrypter.encrypt(plainText);

    // final encrypted = encrypter.encrypt(plainText);
    // final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    // final iv = IV.fromLength(16);
    // final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    // final fernet = Fernet(b64key);
    // final encrypter = Encrypter(fernet);
    // fernetEncrypted = encrypter.encrypt(plainText);
    // print(fernetEncrypted!.base64); // random cipher text
    // print(fernet.extractTimestamp(fernetEncrypted!.bytes));
  }

  static decryptFernet(plainText) {
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final iv = IV.fromLength(16);

    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);

    fernetDecrypted = encrypter.decrypt(fernetEncrypted!);
    // final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    // final iv = IV.fromLength(16);
    // final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    // final fernet = Fernet(b64key);
    // final encrypter = Encrypter(fernet);
    // fernetDecrypted = encrypter.decrypt(fernetEncrypted!);
    // print(fernetDecrypted);
  }
}
