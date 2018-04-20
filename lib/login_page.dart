import 'package:flutter/material.dart';

import 'translation_strings.dart';

typedef void LocaleChangeCallback(Locale locale);

class LoginPage extends StatefulWidget {
  final LocaleChangeCallback onLocaleChange;

  LoginPage({Key key, this.onLocaleChange}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _username;
  String _password;

  TextDirection direction = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: direction,
        child: new Scaffold(
            body: new Theme(
                data: new ThemeData(
                  primaryColor: new Color.fromRGBO(119, 31, 17, 1.0),
                ),
                child: new Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        top: 30.0, right: 16.0, bottom: 30.0, left: 16.0),
                    child: new ListView(
                      children: <Widget>[
                        new Form(
                            key: _formKey,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: (100.0)),
                                new Container(
                                  width: 200.0,
                                  height: 90.0,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        image: new ExactAssetImage(
                                            "assets/logo.jpg"),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                                const SizedBox(height: 120.0),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                    labelText:
                                        Translations.of(context).username,
                                    hintText: "user@katara.net",
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) => val.contains("@")
                                      ? null
                                      : Translations
                                          .of(context)
                                          .not_valid_username,
                                  onSaved: (val) => _username = val,
                                ),
                                const SizedBox(height: 16.0),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                      labelText:
                                          Translations.of(context).password,
                                      border: const OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(0.0)),
                                      )),
                                  obscureText: true,
                                  validator: (val) => val.length < 6
                                      ? Translations
                                          .of(context)
                                          .password_is_too_short
                                      : null,
                                  onSaved: (val) => _password = val,
                                ),
                                const SizedBox(height: 26.0),
                                new MaterialButton(
                                  onPressed: () {
                                    _submit(context);
                                  },
                                  minWidth: 1500.0,
                                  height: 60.0,
                                  color: const Color.fromRGBO(119, 31, 17, 1.0),
                                  child: new Text(
                                    Translations.of(context).login,
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 26.0),
                                new MaterialButton(
                                  onPressed: _change_Language,
                                  minWidth: 1500.0,
                                  height: 60.0,
                                  color: Colors.white,
                                  child: new Text(
                                    Translations.of(context).language,
                                    style: new TextStyle(
                                      color: const Color.fromRGBO(
                                          119, 31, 17, 1.0),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )))));
  }

  _submit(BuildContext context) {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      _performLogin();
      Navigator.pushReplacementNamed(context, "/Links");
    }
  }

  void _performLogin() {
    print("Username: $_username && password: $_password");
  }

  _change_Language() {
    setState(() {
      if (direction == TextDirection.ltr) {
        direction = TextDirection.rtl;
        widget.onLocaleChange(const Locale("ar", ""));
      } else {
        direction = TextDirection.ltr;
        widget.onLocaleChange(const Locale("en", ""));
      }
    });
  }
}
