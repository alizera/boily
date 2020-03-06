import 'package:boily/generated/i18n.dart';
import 'package:boily/ui/boily_widget.dart';
import 'package:example/stores/auth/login_store.dart';
import 'package:example/stores/language/language_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStore _store;
  BoilyWidget body;
  LanguageStore _languageStore;

  @override
  void didChangeDependencies() {
    _store ??= Provider.of<LoginStore>(context);
    _languageStore ??= Provider.of<LanguageStore>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _store.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    body = buildBody(context);
    return Observer(
      builder: (_) => ModalProgressHUD(
        inAsyncCall: _store.isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.appName),
          ),
          body: body,
        ),
      ),
    );
  }

  BoilyWidget buildBody(BuildContext context) {
    var nexLocale = _languageStore.locale == 'fa' ? 'en' : 'fa';

    return BoilyWidget(
      useCustomLoading: true,
      store: _store,
      onTryAgain: () => _store.login(isTryAgain: true),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _store.userNameController,
            decoration: InputDecoration(labelText: S.current.username),
          ),
          const SizedBox(height: 20),
          TextField(
              controller: _store.passwordController,
              decoration: InputDecoration(labelText: S.current.password)),
          const SizedBox(height: 20),
          RaisedButton(
            onPressed: _store.login,
            child: Text(S.current.login),
          ),
          const SizedBox(height: 20),
          FlatButton(
            onPressed: () => _store.login(isSuccess: false),
            child: const Text('fail'),
          ),
          const SizedBox(height: 20),
          FlatButton(
            onPressed: () {
              _languageStore.changeLanguage(nexLocale);
            },
            child: Text(nexLocale),
          ),
        ],
      ),
    );
  }
}
