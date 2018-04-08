import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => new _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  String quantity = "4 - 2018";

  void _onChanged(String value) {
    setState(() {
      quantity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
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
                    "1 - 2018",
                    "2 - 2018",
                    "3 - 2018",
                    "4 - 2018"
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
            new Table(
              border: new TableBorder(
                  horizontalInside: new BorderSide(
                      color: const Color.fromRGBO(214, 214, 214, 1.0))),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //.all(color: new Color.fromRGBO(255, 0, 0, 1.0)),
              defaultColumnWidth: const IntrinsicColumnWidth(),
              children: const <TableRow>[
                const TableRow(
                  children: const <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 5.0, right: 5.0, top: 15.0, bottom: 15.0),
                        child: Text("03/05/2018")),
                    const Text("Tuesday"),
                    const Text("7:40"),
                    const Text("2:51"),
                    const Text("06:40"),
                  ],
                ),
                const TableRow(
                  children: const <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 5.0, right: 5.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          "04/05/2018",
                          style: const TextStyle(color: Colors.red),
                        )),
                    const Text(
                      "Wednesday",
                      style: const TextStyle(color: Colors.red),
                    ),
                    const Text(
                      "7:15",
                      style: const TextStyle(color: Colors.red),
                    ),
                    const Text(
                      "1:30",
                      style: const TextStyle(color: Colors.red),
                    ),
                    const Text(
                      "06:20",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                const TableRow(
                  children: const <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 5.0, right: 5.0, top: 15.0, bottom: 15.0),
                        child: Text("03/05/2018")),
                    const Text("Thursday"),
                    const Text("7:50"),
                    const Text("2:45"),
                    const Text("07:20"),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
