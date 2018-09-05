import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp()); // The main method specifies fat arrow (=>) notation. Use fat arrow notation for one-line functions or methods.

class MyApp extends StatelessWidget { // The app extends StatelessWidget which makes the app itself a widget. In Flutter, almost everything is a widget, including alignment, padding, and layout.
  @override
  Widget build(BuildContext context) { // A widget’s main job is to provide a build() method that describes how to display the widget in terms of other, lower level widgets.
    final wordPair = WordPair.random(); // Use the English words package to generate the text instead of using the string “Hello World”.
    return MaterialApp( // This example creates a Material app. Material is a visual design language that is standard on mobile and the web. Flutter offers a rich set of Material widgets.
      title: 'Welcome to Flutter',
      home: Scaffold( // The Scaffold widget, from the Material library, provides a default app bar, title, and a body property that holds the widget tree for the home screen. The widget subtree can be quite complex.
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}