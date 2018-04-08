// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class _ContactCategory extends StatelessWidget {
  const _ContactCategory({Key key, this.icon, this.children}) : super(key: key);

  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: themeData.dividerColor))),
      child: new DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  width: 72.0,
                  child: new Icon(icon, color: themeData.primaryColor)),
              new Expanded(child: new Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({Key key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines.length > 1),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines
        .sublist(0, lines.length - 1)
        .map((String line) => new Text(line))
        .toList();
    columnChildren
        .add(new Text(lines.last, style: themeData.textTheme.caption));

    final List<Widget> rowChildren = <Widget>[
      new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren))
    ];
    if (icon != null) {
      rowChildren.add(new SizedBox(
          width: 72.0,
          child: new IconButton(
              icon: new Icon(icon),
              color: themeData.primaryColor,
              onPressed: onPressed)));
    }
    return new MergeSemantics(
      child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowChildren)),
    );
  }
}

class ContactsDemo extends StatefulWidget {
  static const String routeName = '/contacts';

  @override
  ContactsDemoState createState() => new ContactsDemoState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class ContactsDemoState extends State<ContactsDemo> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        platform: Theme.of(context).platform,
      ),
      child: new Scaffold(
        key: _scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              flexibleSpace: new FlexibleSpaceBar(
                title: const Text(
                  'Steve Jobs',
                  style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1.0)),
                ),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Image.asset(
                      'assets/profile.jpg',
                      fit: BoxFit.cover,
                      height: _appBarHeight,
                    ),
                    // This gradient ensures that the toolbar icons are distinct
                    // against the background image.
                    const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: const LinearGradient(
                          begin: const Alignment(0.0, -1.0),
                          end: const Alignment(0.0, -0.4),
                          colors: const <Color>[
                            const Color(0x60000000),
                            const Color(0x00000000)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                new _ContactCategory(
                  icon: Icons.call,
                  children: <Widget>[
                    new _ContactItem(
                      lines: const <String>[
                        '(974) 50505050',
                        'Mobile',
                      ],
                    ),
                    new _ContactItem(
                      lines: const <String>[
                        '(974) 44667788',
                        'Work',
                      ],
                    ),
                    new _ContactItem(
                      lines: const <String>[
                        '(974) 44897556',
                        'Home',
                      ],
                    ),
                  ],
                ),
                new _ContactCategory(
                  icon: Icons.contact_mail,
                  children: <Widget>[
                    new _ContactItem(
                      lines: const <String>[
                        'Information Technology',
                        'Department',
                      ],
                    ),
                    new _ContactItem(
                      lines: const <String>[
                        'user@katara.net',
                        'Work',
                      ],
                    ),
                    new _ContactItem(
                      lines: const <String>[
                        'user@katara.net',
                        'Personal',
                      ],
                    ),
                  ],
                ),
                new _ContactCategory(
                  icon: Icons.today,
                  children: <Widget>[
                    new _ContactItem(
                      lines: const <String>[
                        'Birthday',
                        'January 9th, 1989',
                      ],
                    ),
                    new _ContactItem(
                      lines: const <String>[
                        'Wedding anniversary',
                        'June 21st, 2014',
                      ],
                    ),
                    new _ContactItem(
                      lines: const <String>[
                        'First day in office',
                        'January 20th, 2015',
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
