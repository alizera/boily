import 'dart:async';

import 'package:example/data/sharedpref/shared_preference_helper.dart';
import 'package:example/models/auth/login.dart';

import 'network/apis/auth/auth_api.dart';
import 'network/dio_client.dart';


class Repository implements AuthApi, SharedPreferenceHelper {
  // api objects
  final AuthApi _authApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(
    this._sharedPrefsHelper,
    this._authApi,
  );

  // Theme: --------------------------------------------------------------------
  @override
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  @override
  Future<bool> get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  @override
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  @override
  Future<String> get currentLanguage => _sharedPrefsHelper.currentLanguage;

  @override
  DioClient get dioClient => throw UnimplementedError();

  @override
  Future<String> get authToken => _sharedPrefsHelper.authToken;

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  @override
  Future<void> removeAuthToken() => _sharedPrefsHelper.removeAuthToken();

  @override
  Future<void> saveAuthToken(String authToken) =>
      _sharedPrefsHelper.saveAuthToken(authToken);

  @override
  Future<Login> login(String user, String password, [bool isSuccess]) =>
      _authApi.login(user, password, isSuccess);
}
