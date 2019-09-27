import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair =new WordPair.random();
   return new MaterialApp(
     title: 'Hello',
    //  theme:new ThemeData(
    //     primaryColor: Colors.white,
    //   ),
      home: new Scaffold(
        // appBar: new AppBar(
        //   title:new Text('Hello'),  
        // ),
        body: new Center(
          //child: new Text('Hello Word!'),
          // child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),
   );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

// class RandomWordsState extends State<RandomWords> {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = new WordPair.random();
//     return new Text(wordPair.asPascalCase);
//   }
// }

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 12.0);
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random(); // 删除这两行
    // return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('List'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(2.0),
      itemBuilder: (context, i){
        if(i.isOdd) return new Divider();

        final index = i ~/ 2;

        if(index >=_suggestions.length){
          // _suggestions.addAll(generateWordPairs().take(10));
           _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaves = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaves ? Icons.favorite :Icons.favorite_border,
        color:alreadySaves ? Colors.red : null,
      ),
      onTap: (){
        setState((){
          if(alreadySaves){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles =_saved.map(
            (pair){
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style:_biggerFont
                ),
              );
            }
          );

          final divided =ListTile
            .divideTiles(
              context:context,
              tiles: tiles
            )
            .toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text("Saved Suggestions"),
              ),
              body: new ListView(children: divided),
            );
        }
      )
    );
  }
}
