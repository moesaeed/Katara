import 'package:flutter/material.dart';

import 'attendance_page.dart';
import 'contacts.dart';
import 'login_page.dart';
import 'profile.dart';
import 'quick_links.dart';
import 'support.dart';
import 'translation_strings.dart';

class QuickLinks extends StatefulWidget {
  @override
  _QuickLinksState createState() => new _QuickLinksState();
}

class _QuickLinksState extends State<QuickLinks>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Color _bottomNavigationBarColor = new Color.fromRGBO(244, 71, 8, 1.0);
  int _selectedTab = 0;

  void _handleTabSelection() {
    setState(() {
      _selectedTab = _tabController.index;
      switch (_tabController.index) {
        case 0:
          _bottomNavigationBarColor = new Color.fromRGBO(244, 71, 8, 1.0);
          break;
        case 1:
          _bottomNavigationBarColor = new Color.fromRGBO(0, 170, 141, 1.0);
          break;
        case 2:
          _bottomNavigationBarColor = new Color.fromRGBO(63, 81, 181, 1.0);
          break;
        case 3:
          _bottomNavigationBarColor = new Color.fromRGBO(104, 142, 38, 1.0);
          break;
        case 4:
          _bottomNavigationBarColor = new Color(0xFFFFC107);
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Tab> myTabs;

  void _setTabs(BuildContext context) {
    myTabs = <Tab>[
      new Tab(
        icon: new Icon(Icons.http),
        text: Translations.of(context).links,
      ),
      new Tab(
        icon: new Icon(Icons.people),
        text: Translations.of(context).contacts,
      ),
      new Tab(
        icon: new Icon(Icons.query_builder),
        text: Translations.of(context).attendance,
      ),
      new Tab(
        icon: new Icon(Icons.help),
        text: Translations.of(context).support,
      ),
      new Tab(
        icon: new Icon(Icons.person),
        text: Translations.of(context).profile,
      )
    ];
  }

  _logout(BuildContext context) {
    Navigator
        .of(context)
        .pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    _setTabs(context);
    return new Directionality(
        textDirection: direction,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(myTabs[_tabController.index].text),
            backgroundColor: _bottomNavigationBarColor,
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.power_settings_new),
                onPressed: () {
                  _logout(context);
                },
              )
            ],
          ),
          bottomNavigationBar: new Material(
            color: _bottomNavigationBarColor,
            child: new TabBar(
                controller: _tabController,
                tabs: myTabs,
                indicatorColor: Colors.white),
          ),
          body: new TabBarView(controller: _tabController, children: <Widget>[
            new Links(),
            new Contacts(),
            new Attendance(),
            new SupportPage(),
            new ContactsDemo(),
          ]),
        ));
  }
}
