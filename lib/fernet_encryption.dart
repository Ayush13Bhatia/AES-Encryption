import 'package:encrypt/encrypt.dart';

class FernetEcryption {
  //for Fernet Algorithms
  static Encrypted? fernetEncrypted;
  static var fernetDecrypted;

  static encryptFernet(plainText) {
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);
    fernetEncrypted = encrypter.encrypt(plainText);
  }

  static decryptFernet(plainText) {
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);
    fernetDecrypted = encrypter.decrypt(fernetEncrypted!);
  }
}
