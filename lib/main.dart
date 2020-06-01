import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
   // final wordPair = WordPair.random(); //generating random English words
    
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar:AppBar(
        title: Text('Welcome to flutter'),
      ),
      body: Center(
        child: RandomWords(),
      ),
      )
      
    );
  }
}

//stateful widget
class RandomWords extends StatefulWidget{
  @override
   RandomWordsState createState() => RandomWordsState();

}
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context){
    final WordPair wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
 
}