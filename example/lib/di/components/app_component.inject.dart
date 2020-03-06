import 'app_component.dart' as _i1;
import '../modules/netwok_module.dart' as _i2;
import '../modules/preference_module.dart' as _i3;
import '../../data/sharedpref/shared_preference_helper.dart' as _i4;
import 'package:dio/src/dio.dart' as _i5;
import '../../data/network/dio_client.dart' as _i6;
import '../../data/network/apis/auth/auth_api.dart' as _i7;
import '../../data/repository.dart' as _i8;
import 'dart:async' as _i9;
import '../../main.dart' as _i10;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._networkModule, this._preferenceModule);

  final _i2.NetworkModule _networkModule;

  final _i3.PreferenceModule _preferenceModule;

  _i4.SharedPreferenceHelper _singletonSharedPreferenceHelper;

  _i5.Dio _singletonDio;

  _i6.DioClient _singletonDioClient;

  _i7.AuthApi _singletonAuthApi;

  _i8.Repository _singletonRepository;

  static _i9.Future<_i1.AppComponent> create(_i2.NetworkModule networkModule,
      _i3.PreferenceModule preferenceModule) async {
    final injector = AppComponent$Injector._(networkModule, preferenceModule);

    return injector;
  }

  _i10.MyApp _createMyApp() => _i10.MyApp();
  _i8.Repository _createRepository() => _singletonRepository ??= _networkModule
      .provideRepository(_createSharedPreferenceHelper(), _createAuthApi());
  _i4.SharedPreferenceHelper _createSharedPreferenceHelper() =>
      _singletonSharedPreferenceHelper ??=
          _preferenceModule.provideSharedPreferenceHelper();
  _i7.AuthApi _createAuthApi() =>
      _singletonAuthApi ??= _networkModule.provideAuthApi(_createDioClient());
  _i6.DioClient _createDioClient() =>
      _singletonDioClient ??= _networkModule.provideDioClient(_createDio());
  _i5.Dio _createDio() => _singletonDio ??=
      _networkModule.provideDio(_createSharedPreferenceHelper());
  @override
  _i10.MyApp get app => _createMyApp();
  @override
  _i8.Repository getRepository() => _createRepository();
}
