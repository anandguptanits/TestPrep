import 'package:flutter/material.dart';
import 'package:testprep1/ui_elements/freesamplepapers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Preparation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:FreeSamplePaper(),
    );
  }
}