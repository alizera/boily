import 'package:boily/boily.dart';
import 'package:boily/generated/i18n.dart';
import 'package:example/stores/auth/login_store.dart';
import 'package:example/stores/language/language_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inject/inject.dart';
import 'package:provider/provider.dart';
import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'di/components/app_component.dart';
import 'di/modules/netwok_module.dart';
import 'di/modules/preference_module.dart';
import 'ui/auth/login_page.dart';


// global instance for app component
AppComponent appComponent;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    appComponent = await AppComponent.create(
      NetworkModule(),
      PreferenceModule(),
    );
    runApp(appComponent.app);
  });
}

@provide
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final LoginStore _loginStore = LoginStore(appComponent.getRepository());
  final LanguageStore _languageStore =
  LanguageStore(appComponent.getRepository());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginStore>.value(value: _loginStore),
        Provider<LanguageStore>.value(value: _languageStore),
      ],
      child: Observer(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: AppTheme.getLightTheme(),
            locale: Locale(_languageStore.locale),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              S.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
//            localeResolutionCallback: (locale, supportedLocales) =>
//            supportedLocales.firstWhere(
//                    (supportedLocale) =>
//                supportedLocale.languageCode == locale.languageCode,
//                orElse: () => supportedLocales.first),
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
