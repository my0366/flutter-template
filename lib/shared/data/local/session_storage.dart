import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionStorage {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static String accessTokenKey = "access_token";
  static String refreshTokenKey = "refresh_token";

  /// Save access token and refresh token
  static Future<void> saveToken(String accessToken, String refreshToken) async {
    await saveAccessToken(accessToken);
    await saveRefreshToken(refreshToken);
  }

  static Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: accessTokenKey, value: accessToken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: accessTokenKey);
  }

  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: accessTokenKey);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: refreshTokenKey, value: refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: refreshTokenKey);
  }

  static Future<void> deleteRefreshToken() async {
    await _storage.delete(key: refreshTokenKey);
  }
}
