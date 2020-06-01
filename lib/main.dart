import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
   // final wordPair = WordPair.random(); //generating random English words
    
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: RandomWords(),
    );
  }
}

//stateful widget

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = Set<WordPair>();
  
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i){
        if(i.isOdd){
          return Divider();
        }

        final int index = i ~/ 2;

        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite: Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }
          else{
            _saved.add(pair);
          }
        });
      }
    );
  }
 


@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair){
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggesstions'),
            ),
            body: ListView(
              children: divided,
            )
          );
        },
      ),
    );
  }
}

  class RandomWords extends StatefulWidget{
  @override
   RandomWordsState createState() => RandomWordsState();

}