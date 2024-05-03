// ignore_for_file: avoid_print

import 'package:encrypt/encrypt.dart';

class Crypt {
  static final key = Key.fromSecureRandom(32);
  static final iv = IV.fromSecureRandom(16);
  static final encrypter = Encrypter(AES(key));

  static encrypt(plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }

  static decrypt(encryptedText) {
    final decrypted = encrypter.decrypt(encryptedText, iv: iv);
    print(decrypted);
    return decrypted;
  }
}
