import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(
    MyApp()); // The main method specifies fat arrow (=>) notation. Use fat arrow notation for one-line functions or methods.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  // This indicates that we’re using the generic State class specialized for use with RandomWords. Most of the app’s logic and state resides.

  final _suggestions = <
      WordPair>[]; // Add a _suggestions list to the RandomWordsState class for saving suggested word pairings.
  final _biggerFont = const TextStyle(
      fontSize:
          18.0); // Add a biggerFont variable for making the font size larger.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body:
          _buildSuggestions(), // Use _buildSuggestions(), rather than directly calling the word generation library.
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // The itemBuilder callback is called once per suggested word pairing,
        // and places each suggestion into a ListTile row.
        // For even rows, the function adds a ListTile row for the word pairing.
        // For odd rows, the function adds a Divider widget to visually
        // separate the entries. Note that the divider may be difficult
        // to see on smaller devices.
        itemBuilder: (context, i) {
          // Add a one-pixel-high divider widget before each row in theListView.
          if (i.isOdd) return Divider();

          // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings in the ListView,
          // minus the divider widgets.
          final index = i ~/ 2;
          // If you've reached the end of the available word pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    // This function displays each new pair in a ListTile.
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  // RandomWordsState depends on the RandomWords class.
  @override
  RandomWordsState createState() => new RandomWordsState();
}
