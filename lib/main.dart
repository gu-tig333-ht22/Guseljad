import 'package:flutter/material.dart';
import 'package:nyttprojektlen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-do',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Hemma(),
    );
  }
}
