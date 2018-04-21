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
    direction = TextDirection.rtl;
    _localeOverrideDelegate =
        new SpecifiedLocalizationDelegate(const Locale("ar", ""));
  }

  onLocaleChange(Locale l) {
    setState(() {
      _localeOverrideDelegate = new SpecifiedLocalizationDelegate(l);
    });
  }

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
        const Locale('ar', ''), // Arabic
        const Locale('en', ''), // English
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
                backgroundColor: Color.fromRGBO(
                    119, 31, 17, 1.0), //new Color.fromRGBO(244, 71, 8, 1.0),
              ),
              withZoom: true,
              withLocalStorage: true,
            )
      },
      home: new LoginPage(onLocaleChange: onLocaleChange),
    );
  }
}
