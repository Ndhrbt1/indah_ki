// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class Crypt {
  // AES Algorithm
  static final keyAes = Key.fromSecureRandom(32);
  static final iv = IV.fromSecureRandom(16);
  static final encrypter = Encrypter(AES(keyAes));

  static encryptAes(plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }

  static decryptAes(encryptedText) {
    final decrypted = encrypter.decrypt(encryptedText, iv: iv);
    print(decrypted);
    return decrypted;
  }

  // FERNET Algorithm
  // static final keyFernet = Key.fromUtf8('my32lengthsupersecretnooneknows1');

  // static final b64key = Key.fromBase64(base64Url.encode(keyFernet.bytes));
  // static final fernet = Fernet(b64key);
  // static final encrypterFernet = Encrypter(fernet);

  static encryptFernet(plainText, keyCustome) {
    final keyFernet = Key.fromUtf8(keyCustome);

    final b64key = Key.fromBase64(base64Url.encode(keyFernet.bytes));
    final fernet = Fernet(b64key);
    final encrypterFernet = Encrypter(fernet);

    final encrypted = encrypterFernet.encrypt(plainText);
    print(encrypted.base64);
    return encrypted;
  }

  static decryptFernet(encryptedText, keyCustome) {
    final keyFernet = Key.fromUtf8(keyCustome);

    final b64key = Key.fromBase64(base64Url.encode(keyFernet.bytes));
    final fernet = Fernet(b64key);
    final encrypterFernet = Encrypter(fernet);
    final decrypted = encrypterFernet.decrypt(encryptedText);
    print(decrypted);

    return decrypted;
  }
}
