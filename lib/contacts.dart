import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'profile.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => new _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    FutureBuilder futureBuilder = new FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: const CupertinoActivityIndicator(),
              );

            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return createListView(context, snapshot);
          }
        });

    return new Scaffold(
      body: new Theme(
        data: new ThemeData(
          primaryColor: new Color.fromRGBO(255, 0, 0, 1.0),
        ),
        child: futureBuilder,
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Contact> values = snapshot.data;
    return new ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new ListTile(
                  title: new Text(values[index].fullName),
                  subtitle: new Text(values[index].phone),
                  leading: new CircleAvatar(
                    child: new Text(
                      values[index].fullName[0],
                      style: new TextStyle(
                          color: new Color.fromRGBO(255, 255, 255, 1.0)),
                    ),
                    backgroundColor: new Color.fromRGBO(0, 170, 141, 1.0),
                  ),
                  trailing: new IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new ContactDetails(contact: values[index]),
                        );
                        Navigator.of(context).push(route);
                      })
//                new Icon(Icons.info,
//                    color: Theme.of(context).disabledColor),
                  ),
              new Divider(
                height: 2.0,
              )
            ],
          );
        });
  }

  Future<List<Contact>> _getData() async {
    List<Contact> contacts = new List<Contact>();
    contacts.add(new Contact("Saad", "saad@katara.net", "50782277", "IT"));
    contacts.add(new Contact("Khaled", "khaled@katara.net", "50223344", "IT"));

    //await new Future.delayed(new Duration(seconds: 1));

    return contacts;
  }
}

class Contact {
  String fullName;
  String email;
  String phone;
  String dept;

  Contact(name, email, phone, dept) {
    this.fullName = name;
    this.email = email;
    this.phone = phone;
    this.dept = dept;
  }
}

class ContactDetails extends StatefulWidget {
  final Contact contact;
  ContactDetails({Key key, this.contact}) : super(key: key);
  @override
  _ContactDetailsState createState() => new _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: direction,
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text("Contact Details"),
              backgroundColor: new Color.fromRGBO(0, 170, 141, 1.0),
            ),
            body: new CustomScrollView(slivers: <Widget>[
              new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
                  new ContactCategory(
                    icon: Icons.call,
                    children: <Widget>[
                      new ContactItem(
                        lines: const <String>[
                          '(974) 50505050',
                          'Mobile',
                        ],
                      ),
                      new ContactItem(
                        lines: const <String>[
                          '(974) 44667788',
                          'Work',
                        ],
                      ),
                      new ContactItem(
                        lines: const <String>[
                          '(974) 44897556',
                          'Home',
                        ],
                      ),
                    ],
                  ),
                  new ContactCategory(
                    icon: Icons.contact_mail,
                    children: <Widget>[
                      new ContactItem(
                        lines: const <String>[
                          'Information Technology',
                          'Department',
                        ],
                      ),
                      new ContactItem(
                        lines: const <String>[
                          'user@katara.net',
                          'Work',
                        ],
                      ),
                      new ContactItem(
                        lines: const <String>[
                          'user@katara.net',
                          'Personal',
                        ],
                      ),
                    ],
                  ),
                  new ContactCategory(
                    icon: Icons.today,
                    children: <Widget>[
                      new ContactItem(
                        lines: const <String>[
                          'Birthday',
                          'January 9th, 1989',
                        ],
                      ),
                      new ContactItem(
                        lines: const <String>[
                          'Wedding anniversary',
                          'June 21st, 2014',
                        ],
                      ),
                      new ContactItem(
                        lines: const <String>[
                          'First day in office',
                          'January 20th, 2015',
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ])));
  }
}
