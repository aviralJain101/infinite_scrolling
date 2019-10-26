import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main(){
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "infinite_scrolling",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Keep calm and Scroll"),
        ),
        body: _buildSuggestions(),
        ),
      );
  }
}
class _buildSuggestions extends StatefulWidget {
  @override
  __buildSuggestionsState createState() => __buildSuggestionsState();
}

class __buildSuggestionsState extends State<_buildSuggestions> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _bigfont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i){
        if(i.isOdd){return Divider();}
       int index = i~/2;
        if(index>=_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
  Widget _buildRow(WordPair wordpair){
    return ListTile(
      title: Text(
        wordpair.asPascalCase,
        style: _bigfont,
      )
    );
  }
}



