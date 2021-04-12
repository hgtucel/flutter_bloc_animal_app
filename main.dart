import 'package:animals_app/composition_root.dart';
import 'package:flutter/material.dart';

void main() {
  CompositionRoot.configure();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CompositionRoot.composeHomeUI(),
    );
  }
}
