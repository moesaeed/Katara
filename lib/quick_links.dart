import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = "https://twitter.com/kataraqatar";

class TravelDestination {
  const TravelDestination({
    this.assetName,
    this.title,
    this.description,
  });

  final String assetName;

  final String title;
  final List<String> description;

  bool get isValid =>
      assetName != null && title != null && description?.length == 3;
}

final List<TravelDestination> destinations = <TravelDestination>[
  const TravelDestination(
    assetName: 'assets/card1.jpg',
    title: 'Katara Twitter',
    description: const <String>[
      'Katara Cultural Village',
      'Katara s Traditional Handicrafts ',
      'https://twitter.com/kataraqatar',
    ],
  ),
  const TravelDestination(
    assetName: 'assets/card2.jpg',
    title: 'MOFA Website',
    description: const <String>[
      'Apple',
      'Doha',
      'https://www.apple.com',
    ],
  ),
  const TravelDestination(
    assetName: 'assets/card3.jpg',
    title: 'Microsoft',
    description: const <String>[
      'Katara Cultural Village',
      'Katara s Traditional Handicrafts ',
      'https://www.microsoft.com',
    ],
  ),
  const TravelDestination(
    assetName: 'assets/card4.jpg',
    title: 'Facebook',
    description: const <String>[
      'Ministry of Foreign Affairs',
      'Doha',
      'https://www.facebook.com/KataraQatar',
    ],
  ),
  const TravelDestination(
    assetName: 'assets/card1.jpg',
    title: 'Katara Website',
    description: const <String>[
      'Youtube',
      'Katara s Traditional Handicrafts ',
      'https://www.youtube.com/user/KataraQatar',
    ],
  ),
  const TravelDestination(
    assetName: 'assets/card2.jpg',
    title: 'MOFA Website',
    description: const <String>[
      'Instagram',
      'Doha',
      'https://instagram.com/kataraqatar',
    ],
  )
];

class TravelDestinationItem extends StatelessWidget {
  TravelDestinationItem({Key key, @required this.destination})
      : assert(destination != null && destination.isValid),
        super(key: key);

  static const double height = 300.0;
  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(5.0),
        height: height,
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.asset(
                        destination.assetName,
                        fit: BoxFit.cover,
                      ),
                    ),
//
                  ],
                ),
              ),
              // description and share/explore buttons
              new Expanded(
                child: new Center(
                  //padding: const EdgeInsets.fromLTRB(16.0, 20.0, 0.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new FlatButton(
                      child: new Text(destination.description[0],
                          style: titleStyle.copyWith(color: Colors.black54)),
                      textColor: Colors.amber.shade500,
                      onPressed: () {
                        selectedUrl = destination.description[2];

                        Navigator.of(context).pushNamed("/Test/widget");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Links extends StatefulWidget {
  @override
  _QuickLinksState createState() => new _QuickLinksState();
}

class _QuickLinksState extends State<Links> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(
            itemExtent: TravelDestinationItem.height,
            padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            children: destinations.map((TravelDestination destination) {
              return new Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: new TravelDestinationItem(destination: destination));
            }).toList()));
  }
}
