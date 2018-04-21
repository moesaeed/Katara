import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'links_page.dart';
import 'login_page.dart';
import 'quick_links.dart';
import 'translation.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecifiedLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    super.initState();
    _localeOverrideDelegate = new SpecifiedLocalizationDelegate(null);
  }

  onLocaleChange(Locale l) {
    setState(() {
      _localeOverrideDelegate = new SpecifiedLocalizationDelegate(l);
    });
  }

  Key test = new Key("dsfsd");

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      localizationsDelegates: [
        _localeOverrideDelegate,
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('ar', ''), // French
      ],
      debugShowCheckedModeBanner: false,
      title: "Katara Intranet",
      routes: <String, WidgetBuilder>{
        "/Login": (BuildContext context) =>
            new LoginPage(onLocaleChange: onLocaleChange),
        "/Links": (BuildContext context) => new QuickLinks(),
        "/Test": (BuildContext context) => new Links(),
        "/Test/widget": (_) => new WebviewScaffold(
              url: selectedUrl,
              appBar: new AppBar(
                title: new Text("Links"),
                backgroundColor: new Color.fromRGBO(244, 71, 8, 1.0),
              ),
              withZoom: true,
              withLocalStorage: true,
            )
      },
      home: new LoginPage(onLocaleChange: onLocaleChange),
    );
  }
}
