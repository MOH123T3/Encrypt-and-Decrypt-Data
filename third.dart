// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class EncryptData {
//for AES Algorithms

  static Encrypted? encrypted;
  static String decrypted = "";
  static String encoded = "";
  static encryptAES(plainText) {
    final key = Key.fromUtf8('0123456789abcdef');
    final iv = IV.fromUtf8('fedcba9876543210');
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    encoded = base64.encode(utf8.encode(encrypted!.base64));

    print("Encode Data ${encoded}");
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8('0123456789abcdef');
    final iv = IV.fromUtf8('fedcba9876543210');
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    dynamic decoded = utf8.decode(base64.decode(encoded));
    decrypted = encrypter.decrypt(Encrypted.fromBase64(decoded), iv: iv);

    print("Decode Data $decrypted");
  }
}
