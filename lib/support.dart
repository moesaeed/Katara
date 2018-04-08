import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => new _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  String quantity = "Computers & Printers";

  void _onChanged(String value) {
    setState(() {
      quantity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        primaryColor: new Color.fromRGBO(104, 142, 38, 1.0),
      ),
      child: new Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(5.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new DropdownButtonHideUnderline(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: const Color.fromRGBO(210, 210, 210, 1.0),
                    ),
                  ),
                  width: 20.0,
                  child: new DropdownButton<String>(
                    items: <String>[
                      "Computers & Printers",
                      "Applications",
                      "Email",
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: new Text('$value',
                              style: new TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0)),
                        ),
                      );
                    }).toList(),
                    value: quantity,
                    onChanged: (String value) {
                      _onChanged(value);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              new TextFormField(
                decoration: const InputDecoration(
                  //border: const OutlineInputBorder(),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  hintText: 'Tell us about the issue',
                  helperText: 'Keep it short and specific. Required',
                  labelText: 'Issue Details',
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 26.0),
              new MaterialButton(
                onPressed: () {},
                minWidth: 1500.0,
                height: 60.0,
                color: const Color.fromRGBO(104, 142, 38, 1.0),
                child: new Text(
                  "Submit Issue",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
