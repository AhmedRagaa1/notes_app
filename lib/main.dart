import 'package:flutter/material.dart';
import 'package:sqfilte/Home_App_note.dart';
import 'package:sqfilte/Try_Function.dart';
import 'package:sqfilte/addNotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Notes ',
      home: HomeApp(),
      debugShowCheckedModeBanner: false,
      routes: {"addNotes": (context) => AddNotes()},
    );
  }
}
