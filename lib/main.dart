import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hello Flutter',
      home: RandomWords(),
      // home: Scaffold(appBar: AppBar(
      //   title: Text('Hello')
      // ),
      //   body: Center(
      //     // child: Text('Hello World'),
      //     // child: Text(wordPair.asCamelCase),
      //     child: RandomWords(),
      //   ),
      // ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 20.0);

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();
        final ind = i~/2;

        if(ind >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[ind]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title:Text(
        pair.asCamelCase,
        style: _biggerFont,
      )
    );
  }

  @override
  Widget build (BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asCamelCase);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter'),

      ),
      body: _buildSuggestion()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}