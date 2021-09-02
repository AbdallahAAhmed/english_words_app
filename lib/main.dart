import 'package:english_words_app/utilities/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';
import 'dart:io';
import 'package:english_words_app/models/words.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordsPage(),
    );
  }
}

class WordsPage extends StatefulWidget {
  const WordsPage({Key? key}) : super(key: key);

  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  SQL_Helper? helper;
  List<Words>? wordsList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('English Words'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: nouns.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(12.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${nouns[index]}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                trailing: Text(
                  '$index',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
