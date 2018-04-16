import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'links_page.dart';
import 'login_page.dart';
import 'quick_links.dart';

void main() {
  runApp(new MyApp());
}

typedef void LocaleChangeCallback(Locale locale);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: "Katara Intranet",
      routes: <String, WidgetBuilder>{
        "/Login": (BuildContext context) => new LoginPage(),
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
      home: new LoginPage(),
    );
  }
}
