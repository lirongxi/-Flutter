import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  MyApp({this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 80.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(color: Colors.blue[500]),
        child: new Row(
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null,
            ),
            new Expanded(
              child: title,
            ),
            new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            )
          ],
        ));
    // return new Center(
    //   child: new Text(
    //     'Hello, world11111!',
    //     textDirection: TextDirection.ltr,
    //   ),
    // );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyApp(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello Word!'),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'My app',
    home: new MyScaffold(),
  ));
}
